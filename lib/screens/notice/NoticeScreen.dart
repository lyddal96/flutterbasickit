import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kit/models/MemberModel.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================

  /// ==========================================================================
  /// Functions
  /// ==========================================================================

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(title: "공지사항"),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            child: ElevatedButton(
                onPressed: () {
                  var memberModel = MemberModel();
                  memberModel.member_id = "아이디 전달";
                  memberModel.member_pw = "비밀번호 전달";

                  Get.offNamed("/notice/detail", arguments: memberModel);
                },
                child: Text("공지사항 상세")),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
}
