import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kit/r.g.dart';
import 'package:kit/utils/ColorUtils.dart';

class HeaderListWidget extends StatelessWidget {
  const HeaderListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        width: 300,
        height: 120,
        margin: const EdgeInsets.only(right: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: ColorUtils.FFF6D54A,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 90,
                    height: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network("https://picsum.photos/300/300",
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "안녕하세요.",
                        style: theme.textTheme.titleSmall,
                      ),
                      Text(
                        "플랫폼 로캣티어입니다.",
                        style: theme.textTheme.subtitle2,
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
