import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:kit/Constants.dart';
import 'package:kit/main.dart';
import 'package:kit/screens/chat/ChatMessage.dart';
import 'package:kit/screens/chat/ChatRoom.dart';
import 'package:kit/screens/chat/core/ChatCore.dart';
import 'package:kit/screens/chat/messages/TextPartial.dart';
import 'package:kit/screens/chat/widget/DateWidget.dart';
import 'package:kit/screens/chat/widget/ReceiveWidget.dart';
import 'package:kit/screens/chat/widget/SendWidget.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/utils/DatesUtils.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.roomId, required this.users})
      : super(key: key);
  final String roomId;
  final List<String> users;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================
  final ScrollController _listScrollcontroller = ScrollController();
  final TextEditingController _sendTextEditingController =
      TextEditingController();

  /// ==========================================================================
  /// Functions
  /// ==========================================================================
  /// 메세지 보내기 위젯
  Widget _sendWidget() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      height: 61,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)
                ],
              ),
              child: Row(
                children: <Widget>[
                  IconButton(icon: const Icon(Icons.face), onPressed: () {}),
                  Expanded(
                    child: TextField(
                      controller: _sendTextEditingController,
                      decoration: const InputDecoration(
                          hintText: "대화를 입력해주세요.", border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.photo_camera),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
                color: ColorUtils.FF666666, shape: BoxShape.circle),
            child: InkWell(
              child: const Icon(
                Icons.keyboard_voice,
                color: Colors.white,
              ),
              onTap: () {
                TextPartial message =
                    TextPartial(text: _sendTextEditingController.text);
                ChatCore.instance.sendMessage(message, widget.roomId);
                _sendTextEditingController.clear();
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          )
        ],
      ),
    );
  }

  /// 챗 리스트 위젯
  Widget _chatListWidget(AsyncSnapshot<List<ChatMessage>> snapshot) {
    List<ChatMessage> list = snapshot.data!;

    return GroupedListView(
      elements: list,
      groupBy: (element) {
        DateTime date =
            DateTime.fromMillisecondsSinceEpoch(element.updatedAt ?? 0);
        return DateTime(date.year, date.month, date.day);
      },
      order: GroupedListOrder.DESC,
      shrinkWrap: true,
      reverse: true,
      controller: _listScrollcontroller,
      addAutomaticKeepAlives: true,
      useStickyGroupSeparators: false,
      floatingHeader: false,
      scrollDirection: Axis.vertical,
      groupSeparatorBuilder: (value) {
        return DateWidget(date: value.formatDate());
      },
      indexedItemBuilder: (context, element, index) {
        return messageWidget(element);
      },
    );
  }

  /// 메세지 위젯
  Widget messageWidget(ChatMessage message) {
    if (message.author == (prefs.getString(Constants.MEMBER_IDX) ?? "")) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: SendWidget(message: message));
    } else {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: ReceiveWidget(message: message));
    }
  }

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    var room = ChatRoom(id: widget.roomId, users: widget.users);

    return Scaffold(
      appBar: BaseAppBarWidget(title: "RoomId = ${widget.roomId}"),
      body: SafeArea(
        child: Container(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Divider(
                    height: 0,
                    color: Colors.black54,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: StreamBuilder<List<ChatMessage>>(
                      stream: ChatCore.instance.messages(room),
                      initialData: const [],
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                              bottom: 200,
                            ),
                            child: const Text('대화가 없습니다.'),
                          );
                        }

                        SchedulerBinding.instance?.addPostFrameCallback((_) {
                          _listScrollcontroller.animateTo(
                            0,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        });

                        // 목록이 있을 경우
                        return _chatListWidget(snapshot);
                      },
                    ),
                  ),
                  const Divider(height: 0, color: Colors.black26),
                  _sendWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
}
