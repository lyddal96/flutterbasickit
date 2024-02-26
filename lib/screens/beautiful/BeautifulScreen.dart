import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kit/widgets/HeaderListWidget.dart';
import 'package:kit/utils/ColorUtils.dart';

class BeautifulScreen extends StatefulWidget {
  const BeautifulScreen({Key? key}) : super(key: key);

  @override
  State<BeautifulScreen> createState() => _BeautifulScreenState();
}

class _BeautifulScreenState extends State<BeautifulScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================

  /// ==========================================================================
  /// Functions
  /// ==========================================================================

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 320,
                forceElevated: innerBoxIsScrolled,
                backgroundColor: ColorUtils.FFFFFFFF,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: IconButton(
                        color: Colors.black,
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ))
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25 * 3),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, flutterbasickit 🤘",
                              style: theme.textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "로캣티어 킷입니다.",
                              style: theme.textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                          width: double.infinity,
                          height: 120,
                          child: ListView.builder(
                            itemCount: 10,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return HeaderListWidget();
                            },
                          ))
                    ],
                  ),
                ),
              ),
            ];
          },
          body: ListView.builder(
            itemCount: 30,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                margin: EdgeInsets.only(bottom: 1),
                color: Colors.orange,
                alignment: Alignment.center,
                child: Text("$index"),
              );
            },
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
}
