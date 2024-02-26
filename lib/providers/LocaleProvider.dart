import 'package:flutter/cupertino.dart';
import 'package:kit/generated/l10n.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  set locale(Locale? val) {
    _locale = val;
    notifyListeners();
  }

  void setLocale(Locale locale) {
    // if (!l10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
