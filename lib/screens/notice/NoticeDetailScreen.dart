import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kit/main.dart';
import 'package:kit/models/MemberModel.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';

class NoticeDetailScreen extends StatefulWidget {
  const NoticeDetailScreen({Key? key}) : super(key: key);

  @override
  State<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
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
      appBar: BaseAppBarWidget(title: "공지사항 상세"),
    );
  }

  @override
  void initState() {
    super.initState();
    var memberModel = Get.arguments as MemberModel;
    logger.i("받은 데이터 = ${memberModel.member_id} / ${memberModel.member_pw}");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
}
