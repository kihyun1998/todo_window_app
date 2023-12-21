import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/util/helper/intl_helper.dart';

final langProvider = NotifierProvider<LangRiverpod, Locale>(LangRiverpod.new);

class LangRiverpod extends Notifier<Locale> {
  @override
  Locale build() {
    return IntlHelper.en;
  }

  void toggleLang() {
    state = IntlHelper.isKo ? IntlHelper.en : IntlHelper.ko;
  }
}
