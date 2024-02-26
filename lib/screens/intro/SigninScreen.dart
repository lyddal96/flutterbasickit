import 'dart:io';

import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kit/main.dart';
import 'package:kit/models/Apis.dart';
import 'package:kit/models/BaseModel.dart';
import 'package:kit/models/MemberModel.dart';
import 'package:kit/utils/AlertUtils.dart';
import 'package:kit/utils/ApiUtils.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================

  /// ==========================================================================
  /// Functions
  /// ==========================================================================
  /// 회원 로그인
  void memberLoginAPI(BuildContext context, MemberModel request) async {
    try {
      final client = ApiClient(ApiUtils.getDio());
      logger.i("request = ${request.toJson()}");
      client.member_login(request.toJson()).then((value) {
        if (ApiUtils.isSuccessResponse(context, value)) {
          logger.i("API 성공  == ${value.toJson()}");
        } else {}
      });
    } catch (error) {
      logger.e("errror ${error}");
    }
  }

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    final idTextEditingController = TextEditingController();
    final pwTextEditingController = TextEditingController();

    return Scaffold(
      appBar: BaseAppBarWidget(title: 'Sign In'),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  height: 50,
                  color: ColorUtils.FFFFFFFF,
                  child: TextFormField(
                    controller: idTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'ID'),
                    style: TextStyle(color: ColorUtils.FF000000),
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "올바른 이메일을 입력해주세요.",
                  )),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  height: 50,
                  child: TextFormField(
                    controller: pwTextEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'PW'),
                    style: TextStyle(color: ColorUtils.FF000000),
                  )),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextButton(
                    onPressed: () {
                      MemberModel request = MemberModel();
                      request.member_id = idTextEditingController.text;
                      request.member_pw = pwTextEditingController.text;
                      request.device_os = Platform.isAndroid ? "A" : "I";
                      request.gcm_key = "GCM_KEY";

                      memberLoginAPI(context, request);
                    },
                    child: Text('로그인'),
                    style: const ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll(ColorUtils.FF000000),
                        backgroundColor:
                            MaterialStatePropertyAll(ColorUtils.FFF6D54A)),
                  ),
                ),
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
