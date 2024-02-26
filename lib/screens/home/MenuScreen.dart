import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kit/models/MenuModel.dart';
import 'package:kit/r.g.dart';
import 'package:kit/screens/home/SampleUIScreen.dart';
import 'package:kit/screens/home/SettingsScreen.dart';
import 'package:kit/screens/home/WebViewScreen.dart';
import 'package:kit/screens/images/ImagePickerScreen.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/utils/ScreenUtils.dart';
import 'package:kit/widgets/MenuListWidget.dart';

import 'NavigationBarScreen.dart';
import 'SampleListScreen.dart';
import 'SideMenuScreen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() {
    return MenuPageState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MenuPageState extends State<MenuScreen> {
  MenuPageState();

  @override
  Widget build(BuildContext context) {
    List<MenuModel> menuList = <MenuModel>[
      MenuModel(Intl.message("menu_1"), "네비게이션 바 이동을 보여줍니다."),
      MenuModel("화면 이동", "화면 이동 방식을 보여줍니다."),
      MenuModel("입력창, 버튼, 텍스트", "입력창, 버튼, 텍스트 예시를 보여줍니다."),
      MenuModel("이미지 선택", "카메라, 갤러리, 크롭"),
      MenuModel("웹뷰", "웹페이지를 불러옵니다."),
      MenuModel("리스트", "기본 리스트, 데이터가 없을 때 화면을 보여줍니다.")
    ];

    return Scaffold(
      drawer: SideMenuScreen(),
      appBar: AppBar(
        backgroundColor: ColorUtils.FF333333,
        leading: Builder(
          builder: (context) {
            return IconButton(
              color: Colors.white,
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(
          Intl.message("app_name"),
          maxLines: 1,
          style: TextStyle(
              fontFamily: R.fontFamily.nanum,
              fontSize: 18,
              fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.settings),
            onPressed: () {
              ScreenUtils.present(SettingsScreen());
            },
          )
        ],
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          itemCount: menuList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  ScreenUtils.push(NavigationBarScreen());
                } else if (index == 2) {
                  ScreenUtils.push(SampleUIScreen());
                } else if (index == 3) {
                  ScreenUtils.present(ImagePickerScreen());
                } else if (index == 4) {
                  ScreenUtils.push(WebViewScreen());
                } else if (index == 5) {
                  ScreenUtils.push(SampleListScreen());
                }
              },
              child: MenuListWidget(menuList[index]),
            );
          }),
    );
  }
}
