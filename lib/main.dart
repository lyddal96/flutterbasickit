import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kit/generated/l10n.dart';
import 'package:kit/providers/LocaleProvider.dart';
import 'package:kit/providers/ThemeData.dart';
import 'package:kit/providers/ThemeProvider.dart';
import 'package:kit/screens/intro/IntroScreen.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

late final SharedPreferences prefs;

void main() async {
  // --> . main 메소드에서 서버나 SharedPreferences 등 비동기로 데이터를 다룬 다음 runApp을 실행해야하는 경우 아래 한줄을 반드시 추가해야합니다.
  WidgetsFlutterBinding.ensureInitialized();
  // --> . Firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  prefs = await SharedPreferences.getInstance();

  runApp(const BasicApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  logger.i("Handling a background message: ${message.messageId}");
  logger.i('Got a message whilst in the foreground!');
  logger.i('Message data: ${message.data}');

  if (message.notification != null) {
    logger.i('Message also contained a notification: ${message.notification}');
  }
}

/// FCM TOKEN 얻기
void initFCM() async {
  final fcmToken = await FirebaseMessaging.instance.getToken();

  logger.i("FCM TOKEN : $fcmToken");

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  logger.i('알림 권한 상황: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    logger.i('Got a message whilst in the foreground!');
    logger.i('Message data: ${message.data}');

    if (message.notification != null) {
      logger
          .i('Message also contained a notification: ${message.notification}');
    }
  });
}

class BasicApp extends StatelessWidget {
  const BasicApp({super.key});

  @override
  Widget build(BuildContext context) {
    logger.i("Welcome Flutter");
    initFCM();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer2<LocaleProvider, ThemeProvider>(
          builder: (context, localeProv, themeProv, snapshot) {
        return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: GetMaterialApp(
              title: Intl.message("app_name"),
              debugShowCheckedModeBanner: false,
              theme: themeLight(context),
              darkTheme: themeDark(context),
              themeMode: (themeProv.isDarkTheme == true)
                  ? ThemeMode.dark
                  : ThemeMode.light,
              supportedLocales: const [Locale("ko", ""), Locale("en", "")],
              locale: localeProv.locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: IntroScreen(),
            ));
      }),
    );
  }
}
