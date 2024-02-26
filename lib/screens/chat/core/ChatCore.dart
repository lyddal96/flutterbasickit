import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kit/Constants.dart';
import 'package:kit/main.dart';
import 'package:kit/screens/chat/ChatMessage.dart';
import 'package:kit/screens/chat/ChatRoom.dart';
import 'package:kit/screens/chat/core/ChatCoreConfig.dart';
import 'package:kit/screens/chat/core/ChatUtils.dart';
import 'package:kit/screens/chat/messages/CustomMessage.dart';
import 'package:kit/screens/chat/messages/CustomPartial.dart';
import 'package:kit/screens/chat/messages/ImageMessage.dart';
import 'package:kit/screens/chat/messages/ImagePartial.dart';
import 'package:kit/screens/chat/messages/TextMessage.dart';
import 'package:kit/screens/chat/messages/TextPartial.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatCore {
  ChatCore._privateConstructor() {
    userIdx = prefs.getString(Constants.MEMBER_IDX);
    logger.i(userIdx);
  }

  String? userIdx;

  /// Collection name Config
  ChatCoreConfig config = const ChatCoreConfig(null, "rooms");

  /// Singleton instance
  static final ChatCore instance = ChatCore._privateConstructor();

  /// Fire Store 초기화
  FirebaseFirestore getFirebaseFirestore() => config.firebaseAppName != null
      ? FirebaseFirestore.instanceFor(
          app: Firebase.app(config.firebaseAppName!),
        )
      : FirebaseFirestore.instance;

  /// Config
  void setConfig(ChatCoreConfig firebaseChatCoreConfig) {
    config = firebaseChatCoreConfig;
  }

  /// 회원 자신을 세팅
  void initMe(String myIdx) {
    userIdx = myIdx;
  }

  /// 1:1 채팅 방 생성
  Future<ChatRoom> createRoom(
    String otherUserIdx,
    String name,
    String imageUrl, {
    Map<String, dynamic>? metadata,
  }) async {
    final userIdx = this.userIdx;
    if (userIdx == null) {
      return Future.error("User does not exist");
    }

    final userIds = [userIdx, otherUserIdx]..sort();
    final roomQuery = await getFirebaseFirestore()
        .collection(config.roomsCollectionName)
        .where("type", isEqualTo: RoomType.direct.toShortString())
        .where("userIds", isEqualTo: userIds)
        .limit(1)
        .get();

    if (roomQuery.docs.isNotEmpty) {
      final room =
          (await processRoomsQuery(userIdx, getFirebaseFirestore(), roomQuery))
              .first;

      return room;
    }

    final oldRoomQuery = await getFirebaseFirestore()
        .collection(config.roomsCollectionName)
        .where("type", isEqualTo: RoomType.direct.toShortString())
        .where("userIds", isEqualTo: userIds.reversed.toList())
        .limit(1)
        .get();

    if (oldRoomQuery.docs.isNotEmpty) {
      final room = (await processRoomsQuery(
              userIdx, getFirebaseFirestore(), oldRoomQuery))
          .first;
      return room;
    }

    final users = [userIdx, otherUserIdx];
    final room = await getFirebaseFirestore()
        .collection(config.roomsCollectionName)
        .add({
      'createdAt': FieldValue.serverTimestamp(),
      'imageUrl': imageUrl,
      'metadata': metadata,
      'name': name,
      'type': RoomType.direct.toShortString(),
      'updatedAt': FieldValue.serverTimestamp(),
      'userIds': userIds,
    });

    return ChatRoom(
        id: room.id, metadata: metadata, type: RoomType.direct, users: users);
  }

  /// 채팅 방 목록 보기
  Stream<List<ChatRoom>> rooms({bool orderByUpdatedAt = false}) {
    final userIdx = this.userIdx;

    if (userIdx == null) {
      return const Stream.empty();
    }

    final collection = orderByUpdatedAt
        ? getFirebaseFirestore()
            .collection(config.roomsCollectionName)
            .where('userIds', arrayContains: userIdx)
            .orderBy('updatedAt', descending: true)
        : getFirebaseFirestore()
            .collection(config.roomsCollectionName)
            .where('userIds', arrayContains: userIdx);

    logger.i(collection);

    return collection.snapshots().asyncMap(
          (query) => processRoomsQuery(
            userIdx,
            getFirebaseFirestore(),
            query,
          ),
        );
  }

  /// 메세지 발송
  void sendMessage(dynamic partialMessage, String roomId) async {
    if (userIdx == null) return;

    ChatMessage? message;

    if (partialMessage is CustomPartial) {
      message = CustomMessage.fromPartial(
        author: userIdx ?? "",
        id: '',
        partialCustom: partialMessage,
      );
    } else if (partialMessage is ImagePartial) {
      message = ImageMessage.fromPartial(
        author: userIdx ?? "",
        id: '',
        partialImage: partialMessage,
      );
    } else if (partialMessage is TextPartial) {
      message = TextMessage.fromPartial(
        author: userIdx ?? "",
        id: '',
        partialText: partialMessage,
      );
    }

    if (message != null) {
      final messageMap = message.toJson();
      messageMap.removeWhere((key, value) => key == 'author' || key == 'id');
      messageMap['authorId'] = userIdx ?? "";
      messageMap['createdAt'] = FieldValue.serverTimestamp();
      messageMap['updatedAt'] = FieldValue.serverTimestamp();

      await getFirebaseFirestore()
          .collection('${config.roomsCollectionName}/$roomId/messages')
          .add(messageMap);

      await getFirebaseFirestore()
          .collection(config.roomsCollectionName)
          .doc(roomId)
          .update({'updatedAt': FieldValue.serverTimestamp()});
    }
  }

  /// 메세지 가져오기
  Stream<List<ChatMessage>> messages(
    ChatRoom room, {
    List<Object?>? endAt,
    List<Object?>? endBefore,
    int? limit,
    List<Object?>? startAfter,
    List<Object?>? startAt,
  }) {
    var query = getFirebaseFirestore()
        .collection('${config.roomsCollectionName}/${room.id}/messages')
        .orderBy('updatedAt', descending: false);

    if (endAt != null) {
      query = query.endAt(endAt);
    }

    if (endBefore != null) {
      query = query.endBefore(endBefore);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    if (startAfter != null) {
      query = query.startAfter(startAfter);
    }

    if (startAt != null) {
      query = query.startAt(startAt);
    }

    return query.snapshots().map(
          (snapshot) => snapshot.docs.fold<List<ChatMessage>>(
            [],
            (previousValue, doc) {
              final data = doc.data();

              data['author'] = data['authorId'];
              data['createdAt'] = data['createdAt']?.millisecondsSinceEpoch;
              data['id'] = doc.id;
              data['updatedAt'] = data['updatedAt']?.millisecondsSinceEpoch;

              return [...previousValue, ChatMessage.fromJson(data)];
            },
          ),
        );
  }
}
