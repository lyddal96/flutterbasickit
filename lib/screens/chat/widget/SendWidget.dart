import 'package:flutter/widgets.dart';
import 'package:kit/screens/chat/ChatMessage.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/utils/DatesUtils.dart';

class SendWidget extends StatelessWidget {
  const SendWidget({Key? key, required this.message}) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorLight.info,
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            "${message.text ?? ""}\n ${DateTime.fromMillisecondsSinceEpoch(message.createdAt ?? 0).formatDateString("yyyy-MM-dd HH:mm:ss")}",
            style: const TextStyle(fontSize: 15, color: ColorUtils.FFFFFFFF),
          ),
        ));
  }
}
