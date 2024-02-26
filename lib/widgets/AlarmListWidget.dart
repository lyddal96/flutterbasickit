import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kit/models/AlarmModel.dart';
import 'package:kit/r.g.dart';
import 'package:kit/utils/ColorUtils.dart';

class AlarmListWidget extends StatelessWidget {
  const AlarmListWidget(
      {Key? key, required this.index, required this.alarmModel})
      : super(key: key);

  final int index;
  final AlarmModel alarmModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${index} / ${alarmModel.msg ?? ""}",
                  style: TextStyle(
                      fontSize: 18,
                      color: ColorUtils.FF333333,
                      fontFamily: R.fontFamily.nanum,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  alarmModel.ins_date ?? "",
                  style: TextStyle(
                      fontSize: 12,
                      color: ColorUtils.FF999999,
                      fontFamily: R.fontFamily.nanum,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: ColorUtils.FFDDDDDD,
          )
        ],
      ),
    ));
  }
}
