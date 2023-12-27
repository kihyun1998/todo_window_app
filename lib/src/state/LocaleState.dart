// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_window_app/util/helper/intl_helper.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class LocaleState {
  final Locale locale;
  final S language;

  LocaleState({
    Locale? locale,
    S? language,
  })  : locale = locale ?? IntlHelper.en,
        language = language ?? S(); // null일 때 S()를 준 이유는 처음에 초기화 해야해서

  LocaleState copyWith({
    Locale? locale,
    S? language,
  }) {
    return LocaleState(
      locale: locale ?? this.locale,
      language: S.current,
    );
  }
}
