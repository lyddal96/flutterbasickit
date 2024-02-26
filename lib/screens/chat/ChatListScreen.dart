import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kit/Constants.dart';
import 'package:kit/main.dart';
import 'package:kit/screens/chat/ChatRoom.dart';
import 'package:kit/screens/chat/ChatScreen.dart';
import 'package:kit/screens/chat/core/ChatCore.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/utils/DatesUtils.dart';
import 'package:kit/utils/ScreenUtils.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================
  final memberIdxController = TextEditingController();
  final userIdxController = TextEditingController();

  /// ==========================================================================
  /// Functions
  /// ==========================================================================

  /// 멤버 회원 인덱스 추가
  void _setMemberIdx() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.MEMBER_IDX, memberIdxController.text);
  }

  /// 채팅 - 방 생성
  void _createRoom() async {
    final room = await ChatCore.instance.createRoom(
        userIdxController.text, "세종 2-2", "https://i.pravatar.cc/300");
    logger.i(room.toString());
  }

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBarWidget(title: "채팅 목록"),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    controller: memberIdxController,
                    keyboardType: TextInputType.number,
                    cursorColor: ColorUtils.FF000000,
                    decoration: InputDecoration(labelText: "회원인덱스"),
                    textInputAction: TextInputAction.done,
                    validator: (value) {},
                  )),
              ElevatedButton(
                  onPressed: () {
                    _setMemberIdx();
                  },
                  child: Text("회원 인덱스 등록")),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    controller: userIdxController,
                    keyboardType: TextInputType.number,
                    cursorColor: ColorUtils.FF000000,
                    decoration: InputDecoration(labelText: "상대방 인덱스"),
                    textInputAction: TextInputAction.done,
                    validator: (value) {},
                  )),
              ElevatedButton(
                  onPressed: () {
                    _createRoom();
                  },
                  child: Text("채팅방 생성")),
              StreamBuilder<List<ChatRoom>>(
                stream: ChatCore.instance.rooms(),
                initialData: const [],
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        bottom: 200,
                      ),
                      child: const Text('No rooms'),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final room = snapshot.data![index];

                      return GestureDetector(
                        onTap: () {
                          ChatScreen chatScreen = ChatScreen(
                              roomId: snapshot.data![index].id,
                              users: snapshot.data![index].users);
                          ScreenUtils.push(chatScreen);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                child: Image.network(room.imageUrl!),
                              ),
                              Text(
                                "${room.name ?? ""} - ${DatesUtils.readTimestamp(room.updatedAt ?? 0)}",
                                style: TextStyle(color: ColorUtils.FF333333),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    memberIdxController..text = prefs.getString(Constants.MEMBER_IDX) ?? "";
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
}
