import 'package:flutter/material.dart';
import 'package:kit/providers/ThemeProvider.dart';
import 'package:kit/utils/ColorUtils.dart';
import 'package:provider/provider.dart';

ThemeData themeLight(BuildContext context) {
  final theme = Provider.of<ThemeProvider>(context);

  Color _primaryLight(ThemeUIKit val) {
    switch (val) {
      case ThemeUIKit.basic:
        return PrimaryColorLight.basic;
    }
  }

  return ThemeData(
    brightness: Brightness.light,
    backgroundColor: ColorLight.background,
    cardColor: ColorLight.card,
    disabledColor: ColorLight.disabledButton,
    errorColor: ColorLight.error,
    hintColor: ColorLight.fontSubtitle,
    indicatorColor: _primaryLight(theme.themeUIKit),
    primaryIconTheme: const IconThemeData(
      color: ColorLight.fontTitle,
    ),
    primaryColor: _primaryLight(theme.themeUIKit),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: _primaryLight(theme.themeUIKit),
    ),
    scaffoldBackgroundColor: ColorLight.background,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    // textTheme:
  );
}

ThemeData themeDark(BuildContext context) {
  final theme = Provider.of<ThemeProvider>(context);

  Color _primaryDark(ThemeUIKit val) {
    switch (val) {
      case ThemeUIKit.basic:
        return PrimaryColorDark.basic;
    }
  }

  return ThemeData(
    brightness: Brightness.dark,
    backgroundColor: ColorDark.background,
    cardColor: ColorDark.card,
    disabledColor: ColorDark.disabledButton,
    errorColor: ColorDark.error,
    hintColor: ColorDark.fontSubtitle,
    indicatorColor: _primaryDark(theme.themeUIKit),
    primaryIconTheme: const IconThemeData(
      color: ColorDark.fontTitle,
    ),
    primaryColor: _primaryDark(theme.themeUIKit),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: _primaryDark(theme.themeUIKit),
    ),
    scaffoldBackgroundColor: ColorDark.background,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    // textTheme:
  );
}
