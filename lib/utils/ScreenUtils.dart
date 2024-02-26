import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class ScreenUtils {
  /// PUSH - 화면 전환
  static void push(Widget targetWidget) {
    Get.to(targetWidget,
        transition: Transition.cupertino,
        duration: const Duration(milliseconds: 300));
  }

  /// PUSH - 현재 화면 제거 후 화면 전환
  static void pushOff(Widget targetWidget) {
    Get.off(targetWidget,
        transition: Transition.cupertino,
        duration: const Duration(milliseconds: 300));
  }

  /// PRESENT - 화면 전환
  static void present(Widget targetWidget) {
    Get.to(targetWidget,
        transition: Transition.downToUp,
        duration: const Duration(milliseconds: 300));
  }

  /// PRESENT - 현재 화면 제거 후 화면 전환
  static void presentOff(Widget targetWidget) {
    Get.off(targetWidget,
        transition: Transition.downToUp,
        duration: const Duration(milliseconds: 300));
  }

  /// ZOOM - 화면 전환
  static void zoom(Widget targetWidget) {
    Get.to(targetWidget,
        transition: Transition.zoom,
        duration: const Duration(milliseconds: 300));
  }

  /// ZOOM - 모든 화면 제거 후 화면 전환
  static void zoomOffAll(Widget targetWidget) {
    Get.offAll(targetWidget,
        transition: Transition.zoom,
        duration: const Duration(milliseconds: 300));
  }
}
