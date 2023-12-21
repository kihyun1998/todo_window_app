import 'dart:ui';

import 'package:intl/intl.dart';

abstract class IntlHelper {
  static const Locale en = Locale('en');
  static const Locale ko = Locale('ko');

  static bool get isKo => Intl.getCurrentLocale() == ko.languageCode;
}
