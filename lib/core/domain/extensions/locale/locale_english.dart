import 'package:flutter/cupertino.dart';

extension DarkMode on BuildContext {
  bool get isLocaleEnglish {
    Locale currentLocal = Localizations.localeOf(this);
    return currentLocal == const Locale("en");
  }
}
