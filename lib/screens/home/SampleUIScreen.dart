import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kit/utils/AlertUtils.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/main.dart';
import 'package:kit/r.g.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';

class SampleUIScreen extends StatefulWidget {
  const SampleUIScreen({Key? key}) : super(key: key);

  @override
  State<SampleUIScreen> createState() => _SampleUIScreenState();
}

class _SampleUIScreenState extends State<SampleUIScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================
  var isSelected = <bool>[true, false, false];
  List<String> dropdownList = [
    'dropdownList1',
    'dropdownList2',
    'dropdownList3'
  ];
  String selectedDropdown = 'dropdownList1';
  String dropdownValue = 'Dog';
  bool _isTileChecked = false;
  bool _isChecked = false;

  /// ==========================================================================
  /// Functions
  /// ==========================================================================

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(title: 'Sample UI'),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  padding: EdgeInsets.zero,
                  height: 50,
                  child: TextFormField(
                    cursorColor: ColorUtils.FF000000,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                      ),
                      hintText: '이름',
                    ),
                    textInputAction: TextInputAction.next,
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: ColorUtils.FF000000,
                    decoration: InputDecoration(labelText: '이메일'),
                    textInputAction: TextInputAction.done,
                    validator: (value) {},
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                      cursorColor: ColorUtils.FF000000,
                      decoration: InputDecoration(
                          icon: Image(image: R.image.head_btn_search()),
                          labelText: '검색'),
                      textInputAction: TextInputAction.search)),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    cursorColor: ColorUtils.FF000000,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "hint",
                      helperText: "설명란",
                      labelText: "내용2",
                    ),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    cursorColor: ColorUtils.FF000000,
                    decoration: const InputDecoration(
                      hintText: '닉네임',
                      helperText: '닉네임은 6자 이내로 입력해주세요.',
                      border: OutlineInputBorder(),
                    ),
                    maxLength: 6,
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  height: 45,
                  child: CupertinoTextField(
                    cursorColor: ColorUtils.FF000000,
                    placeholder: 'IOS Style TextField',
                    clearButtonMode: OverlayVisibilityMode.editing,
                  )),
              SizedBox(height: 20),
              Divider(height: 2, color: ColorUtils.FF333333),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('TextButton'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        label: Text('TextButton with Icon'))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(children: <Widget>[
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: Text('OutlinedButton'))),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.adb_sharp),
                          label: const Text(
                            'OLButton With Icon',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )))
                ]),
              ),
              Container(
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Text('ElevateButton')),
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle),
                        label: Text('ElevateButton With Icon'))
                  ],
                ),
              ),
              ToggleButtons(
                borderColor: ColorUtils.FF8953BB,
                color: ColorUtils.FF8953BB,
                selectedColor: ColorUtils.FF8953BB,
                selectedBorderColor: ColorUtils.FF8953BB,
                fillColor: ColorUtils.FF8953BB.withOpacity(0.08),
                splashColor: ColorUtils.FF8953BB.withOpacity(0.12),
                hoverColor: ColorUtils.FF8953BB.withOpacity(0.04),
                borderRadius: BorderRadius.circular(4),
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: isSelected,
                onPressed: (index) {
                  setState(() {
                    for (int i = 0; i < 3; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                children: const [
                  Text('Button1'),
                  Text('Button2'),
                  Text('Button3'),
                ],
              ),
              Container(
                  child: GestureDetector(
                onTap: () {
                  logger.i('GestureDetector');
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      activeColor: ColorUtils.FF8953BB,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      '체크박스',
                      style: TextStyle(color: ColorUtils.FF000000),
                    )
                  ],
                ),
              )),
              CheckboxListTile(
                value: _isTileChecked,
                selected: _isTileChecked,
                title: Text('체크박스 리스트 타일'),
                onChanged: (value) {
                  setState(() {
                    _isTileChecked = value!;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: DropdownButton(
                    isExpanded: true,
                    value: selectedDropdown,
                    items: dropdownList.map((String item) {
                      return DropdownMenuItem(
                          child: Text('$item'), value: item);
                    }).toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        selectedDropdown = value;
                      });
                    }),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    width: 150,
                    height: 50,
                    transformAlignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: InputDecorator(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(right: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                            child: DropdownButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          value: dropdownValue,
                          isExpanded: true,
                          items: <String>[
                            'Dog',
                            'Cat',
                            'Tiger',
                            'Lion',
                            'Hippopotamus'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                        )),
                      ),
                    )),
              ),
              const SizedBox(
                height: 300,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
}
