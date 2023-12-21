import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

extension ThemeServiceExt on WidgetRef {
  AppTheme get theme => watch(themeProvider);
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppFontType get font => theme.font;
}
