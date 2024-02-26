import 'package:flutter/material.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/screens/home/NavigationBarScreen.dart';
import 'package:kit/models/MenuModel.dart';
import 'package:kit/r.g.dart';

class MenuListWidget extends StatelessWidget {
  const MenuListWidget(this._menuModel, {super.key});

  final MenuModel _menuModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: ColorUtils.FFFFFFFF),
          boxShadow: const [
            BoxShadow(
              color: ColorUtils.FFECECEC,
              spreadRadius: 5,
              blurRadius: 2,
              // offset: Offset(0, 2))
            )
          ]),
      child: Ink(
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_menuModel.title,
                      style: TextStyle(
                          color: ColorUtils.FF333333,
                          fontSize: 18,
                          fontFamily: R.fontFamily.nanum,
                          fontWeight: FontWeight.w900)),
                  SizedBox(height: 10),
                  Text(_menuModel.description,
                      style: TextStyle(
                          color: ColorUtils.FF333333,
                          fontSize: 14,
                          fontFamily: R.fontFamily.nanum,
                          fontWeight: FontWeight.w300))
                ],
              ))),
    );
  }
}
