import 'package:flutter/material.dart';
import 'package:kit/utils/ColorUtils.dart';

import '../r.g.dart';

class BaseAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  BaseAppBarWidget({Key? key, required this.title, this.center = true})
      : super(key: key);

  final AppBar appBar = AppBar();
  final String title;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorUtils.FF333333,
      leading: IconButton(
        color: Colors.white,
        icon: Image(
          image: R.image.head_btn_back_white(),
          width: 24,
          height: 24,
        ),
        onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
      ),
      centerTitle: center,
      title: Text(
        title,
        style: const TextStyle(
            color: ColorUtils.FFFFFFFF,
            fontSize: 18.0,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
