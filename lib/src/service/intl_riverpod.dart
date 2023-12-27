import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/state/LocaleState.dart';
import 'package:todo_window_app/util/helper/intl_helper.dart';

final intlProvider =
    NotifierProvider<IntlRiverpod, LocaleState>(IntlRiverpod.new);

class IntlRiverpod extends Notifier<LocaleState> {
  @override
  LocaleState build() {
    return LocaleState(locale: IntlHelper.en);
  }

  void toggleLanguage() {
    state =
        state.copyWith(locale: IntlHelper.isKo ? IntlHelper.en : IntlHelper.ko);
  }
}
