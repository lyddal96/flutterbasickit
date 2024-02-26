import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kit/main.dart';
import 'package:kit/models/AlarmModel.dart';
import 'package:kit/models/Apis.dart';
import 'package:kit/r.g.dart';
import 'package:kit/utils/ApiUtils.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:kit/widgets/AlarmListWidget.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';
import 'package:kit/widgets/EmptyWidget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================
  AlarmModel _alarmResponse = AlarmModel();
  final PagingController<int, AlarmModel> _pagingController =
      PagingController(firstPageKey: 1);

  /// ==========================================================================
  /// Functions
  /// ==========================================================================
  /// 알림 목록
  Future<void> _alarmListAPI(int pageKey) async {
    AlarmModel request = AlarmModel();
    request.member_idx = "1";
    request.page_num = pageKey;

    try {
      final client = ApiClient(ApiUtils.getDio());
      client.alarm_list(request.toJson()).then((value) {
        if (ApiUtils.isSuccessResponse(context, value)) {
          logger.i("API 성공  == ${value.toJson()}");
          _alarmResponse = value;
          final dataArray = value.data_array ?? <AlarmModel>[];

          if (_alarmResponse.isLastPage()) {
            _pagingController.appendLastPage(dataArray);
          } else {
            _pagingController.appendPage(
                dataArray, _alarmResponse.getNextPage());
          }
        } else {}
      });
    } catch (error) {
      logger.e("errror ${error}");
      _pagingController.error = error;
    }
  }

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(
        title: "알림",
      ),
      body: LiquidPullToRefresh(
          onRefresh: () {
            return Future.sync(
              () {
                _pagingController.refresh();
              },
            );
          },
          height: 60,
          springAnimationDurationInMilliseconds: 300,
          showChildOpacityTransition: false,
          color: ColorUtils.FF333333,
          child: PagedListView(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<AlarmModel>(
              itemBuilder: (context, item, index) {
                return AlarmListWidget(index: index, alarmModel: item);
              },
              noItemsFoundIndicatorBuilder: (context) {
                return EmptyWidget(emptyTitle: "목록이 없습니다.");
              },
            ),
          )),
    );
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _alarmListAPI(pageKey);
    });

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // alarmListAPI();
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
