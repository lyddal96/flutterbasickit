import 'package:flutter/widgets.dart';

@immutable
class ChatCoreConfig {
  const ChatCoreConfig(
    this.firebaseAppName,
    this.roomsCollectionName,
  );

  /// Property to set custom firebase app name.
  final String? firebaseAppName;

  /// Property to set rooms collection name.
  final String roomsCollectionName;
}
