import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kit/providers/LocaleProvider.dart';
import 'package:kit/r.g.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================
  List<String> localeList = ["한국어", "English"];
  bool isSwitched = false;

  /// ==========================================================================
  /// Functions
  /// ==========================================================================

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    final localeProv = Provider.of<LocaleProvider>(context);
    return Scaffold(
      appBar: BaseAppBarWidget(
        title: Intl.message("setting"),
      ),
      body: Container(
        color: ColorUtils.FFECECEC,
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "설정",
              style: TextStyle(
                  color: ColorUtils.FF333333,
                  fontFamily: R.fontFamily.nanum,
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
          ),
          Divider(
            thickness: 1,
            color: ColorUtils.FFECECEC,
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: ColorUtils.FFFFFFFF,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SwitchListTile(
                      value: isSwitched,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      title: Text("알림설정"),
                    ),
                    DropdownButton(
                        isExpanded: true,
                        value: Intl.getCurrentLocale() == "en"
                            ? localeList[1]
                            : localeList[0],
                        items: localeList.map((String item) {
                          return DropdownMenuItem(
                            child: Text('$item'),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            if (Intl.getCurrentLocale() == "en") {
                              localeProv.setLocale(Locale("ko", ""));
                            } else {
                              localeProv.setLocale(Locale("en", ""));
                            }
                          });
                        })
                  ],
                ),
              )),
        ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
}
