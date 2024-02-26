import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kit/r.g.dart';
import 'package:kit/screens/home/MainScreen.dart';
import 'package:page_transition/page_transition.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================

  /// ==========================================================================
  /// Functions
  /// ==========================================================================
  /// 타이머 실행
  void setTimer(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(const MainScreen(), transition: Transition.zoom);
      // Get.offAll(MainScreen());
    });
  }

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    setTimer(context);
    return Center(
        child: Image(
      image: R.image.web_hi_res_512(),
      width: (MediaQuery.of(context).size.width / 4),
      fit: BoxFit.fitWidth,
    ));
  }

  @override
  void initState() {
    super.initState();
  }
}
