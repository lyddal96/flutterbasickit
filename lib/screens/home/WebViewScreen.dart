import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kit/widgets/BaseAppBarWidget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
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
    var controller = WebViewController()
      ..loadRequest(Uri.parse('https://flutter.dev'));

    return Scaffold(
      appBar: BaseAppBarWidget(title: '웹뷰'),
      body: WebViewWidget(controller: controller),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }
}
