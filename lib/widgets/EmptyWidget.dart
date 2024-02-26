import 'package:flutter/widgets.dart';
import 'package:kit/utils/ColorUtils.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.emptyTitle, this.emptyImage});

  final String emptyTitle;
  final Image? emptyImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: _emptyWidget(),
        ),
      ),
    );
  }

  /// 리스트 없는 경우 안내문구
  List<Widget> _emptyWidget() {
    if (emptyImage != null) {
      return <Widget>[
        const SizedBox(height: 150),
        Container(child: emptyImage),
        const SizedBox(height: 50),
        Text(
          emptyTitle,
        )
      ];
    } else {
      return <Widget>[const SizedBox(height: 150), Text(emptyTitle)];
    }
  }
}
