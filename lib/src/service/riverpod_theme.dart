// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todo_window_app/style/dart_theme.dart';
import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/style/light_theme.dart';

final themeProvider =
    NotifierProvider<RiverpodTheme, AppTheme>(RiverpodTheme.new);

class RiverpodTheme extends Notifier<AppTheme> {
  @override
  build() {
    return LightTheme();
  }

  void toggleTheme(AppTheme theme) {
    if (theme.brightness == Brightness.light) {
      theme = DarkTheme();
    } else {
      theme = LightTheme();
    }
  }
}
