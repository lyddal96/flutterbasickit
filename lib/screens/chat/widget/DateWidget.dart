import 'package:flutter/widgets.dart';
import 'package:kit/utils/ColorUtils.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({Key? key, required this.date}) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: ColorDark.success,
            border: Border.all(color: ColorLight.success),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
