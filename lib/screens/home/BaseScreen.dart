import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kit/models/MenuModel.dart';
import 'package:kit/screens/alarm/AlarmScreen.dart';
import 'package:kit/screens/chat/ChatListScreen.dart';
import 'package:kit/screens/notice/NoticeScreen.dart';
import 'package:kit/utils/ScreenUtils.dart';
import 'package:kit/widgets/MenuListWidget.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================
  final List<MenuModel> _menuList = <MenuModel>[
    MenuModel("공지사항", "공지사항 목록"),
    MenuModel("알림목록", "알림 목록"),
    MenuModel("채팅", "채팅 목록 "),
  ];

  /// ==========================================================================
  /// Functions
  /// ==========================================================================

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          itemCount: _menuList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  ScreenUtils.push(const NoticeScreen());
                } else if (index == 1) {
                  ScreenUtils.push(const AlarmScreen());
                } else if (index == 2) {
                  ScreenUtils.push(const ChatListScreen());
                }
              },
              child: MenuListWidget(_menuList[index]),
            );
          },
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
