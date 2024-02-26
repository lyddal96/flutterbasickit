import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kit/main.dart';
import 'package:kit/models/Apis.dart';
import 'package:kit/models/BaseModel.dart';
import 'package:kit/models/UserModel.dart';
import 'package:kit/r.g.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';
import 'package:kit/widgets/EmptyWidget.dart';
import 'package:kit/widgets/SampleListWidget.dart';

class SampleListScreen extends StatefulWidget {
  const SampleListScreen({Key? key}) : super(key: key);

  @override
  State<SampleListScreen> createState() => _SampleListScreenState();
}

class _SampleListScreenState extends State<SampleListScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================
  List<BaseModel> sampleList = <BaseModel>[];

  /// ==========================================================================
  /// Functions
  /// ==========================================================================
  FutureBuilder<UserModel> _buildBody(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<UserModel>(
      future: client.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final UserModel? userResponse = snapshot.data;
          logger.i("API 성공  == ${userResponse!.toJson()}");

          return ListView.separated(
            // 리스트에 구분자를 추가
            padding: EdgeInsets.zero,
            itemCount:
                userResponse!.data!.isEmpty ? 1 : userResponse!.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return userResponse.data!.isEmpty
                  // ? EmptyWidget(emptyTitle: '리스트가 없습니다.')
                  ? EmptyWidget(
                      emptyTitle: '리스트가 없습니다.',
                      emptyImage: Image(image: R.image.event_detail_img()))
                  : SampleListWidget(
                      user: userResponse!.data![index]!,
                    );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(
        title: 'Sample List',
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // for (int index = 1; index < 21; index++) {
            //   BaseModel value = BaseModel(index);
            //   sampleList.add(value);
            // }
          });
        },
        backgroundColor: ColorUtils.FF8953BB,
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
}
