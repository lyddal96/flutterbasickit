import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kit/screens/chat/ChatRoom.dart';

/// Extension with one [toShortString] method.
extension RoomTypeToShortString on RoomType {
  /// Converts enum to the string equal to enum's name.
  String toShortString() => toString().split('.').last;
}

/// Returns a list of [types.Room] created from Firebase query.
/// If room has 2 participants, sets correct room name and image.
Future<List<ChatRoom>> processRoomsQuery(
  String userIdx,
  FirebaseFirestore instance,
  QuerySnapshot<Map<String, dynamic>> query,
) async {
  final futures = query.docs.map(
    (doc) => processRoomDocument(doc, userIdx, instance),
  );

  return await Future.wait(futures);
}

/// Returns a [types.Room] created from Firebase document.
Future<ChatRoom> processRoomDocument(
  DocumentSnapshot<Map<String, dynamic>> doc,
  String userIdx,
  FirebaseFirestore instance,
) async {
  final data = doc.data()!;

  data['createdAt'] = data['createdAt']?.millisecondsSinceEpoch;
  data['id'] = doc.id;
  data['updatedAt'] = data['updatedAt']?.millisecondsSinceEpoch;

  var imageUrl = data['imageUrl'] as String?;
  var name = data['name'] as String?;
  final type = data['type'] as String;
  final userIds = data['userIds'] as List<dynamic>;

  if (type == RoomType.direct.toShortString()) {
    try {
      // final otherUser = userIds.firstWhere(
      //   (u) => u['id'] != userIdx,
      // );

      // imageUrl = otherUser['imageUrl'] as String?;
      // name = '${otherUser['firstName'] ?? ''} ${otherUser['lastName'] ?? ''}'
      //     .trim();
    } catch (e) {
      // Do nothing if other user is not found, because he should be found.
      // Consider falling back to some default values.
    }
  }

  data['imageUrl'] = imageUrl;
  data['name'] = name;
  data['users'] = userIds;

  if (data['lastMessages'] != null) {
    final lastMessages = data['lastMessages'].map((lm) {
      // final author = users.firstWhere(
      //   (u) => u['id'] == lm['authorId'],
      //   orElse: () => {'id': lm['authorId'] as String},
      // );

      lm['author'] = data['author'];
      lm['createdAt'] = lm['createdAt']?.millisecondsSinceEpoch;
      lm['id'] = lm['id'] ?? '';
      lm['updatedAt'] = lm['updatedAt']?.millisecondsSinceEpoch;

      return lm;
    }).toList();

    data['lastMessages'] = lastMessages;
  }

  return ChatRoom.fromJson(data);
}
