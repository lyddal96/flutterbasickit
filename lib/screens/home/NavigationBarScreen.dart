import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kit/utils/AlertUtils.dart';
import 'package:kit/main.dart';
import 'package:kit/r.g.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';
import 'package:kit/widgets/PrimaryButtonWidget.dart';

class NavigationBarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigationBarState();
  }
}

class NavigationBarState extends State<NavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(title: '네비게이션바'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                PrimaryButtonWidget("Settings", () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("세팅 터치"), duration: Duration(seconds: 1)));
                }),
                SizedBox(
                  height: 20,
                ),
                PrimaryButtonWidget("Custom", () {
                  logger.i("커스텀 터치");
                  AlertUtils.showAlert(
                      context, "flutterbasickit", "알림을 위한 문구를 추가 합니다.", "확인", () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("알림 닫기"),
                        duration: Duration(seconds: 1)));
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
