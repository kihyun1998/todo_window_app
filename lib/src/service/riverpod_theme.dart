import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_window_app/style/dart_theme.dart';
import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/style/light_theme.dart';

final themeProvider =
    NotifierProvider<RiverpodTheme, AppTheme>(RiverpodTheme.new);

class RiverpodTheme extends Notifier<AppTheme> {
  @override
  AppTheme build() {
    return LightTheme();
  }

  void toggleTheme() {
    if (state.brightness == Brightness.light) {
      state = DarkTheme();
    } else {
      state = LightTheme();
    }
  }
}
