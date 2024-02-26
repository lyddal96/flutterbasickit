import 'package:flutter/widgets.dart';
import 'package:kit/screens/chat/ChatMessage.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/utils/DatesUtils.dart';

class ReceiveWidget extends StatelessWidget {
  const ReceiveWidget({Key? key, required this.message}) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorUtils.FFECECEC,
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            "${message.text ?? ""}\n ${DateTime.fromMillisecondsSinceEpoch(message.createdAt ?? 0).formatDateString("yyyy-MM-dd HH:mm:ss")}",
            style: TextStyle(fontSize: 15),
          ),
        ));
  }
}
