import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/configService.dart';
import 'package:todo_window_app/style/dart_theme.dart';
import 'package:todo_window_app/style/foundation/app_mode.dart';
import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/style/light_theme.dart';

final themeProvider =
    NotifierProvider<ThemeRiverpod, AppTheme>(ThemeRiverpod.new);

class ThemeRiverpod extends Notifier<AppTheme> {
  final ConfigService configService = ConfigService();

  @override
  AppTheme build() {
    return LightTheme();
  }

  void toggleTheme() {
    if (state.mode == AppMode.light) {
      state = DarkTheme();
    } else {
      state = LightTheme();
    }

    // [ToDo]: 적용하기 버튼 누르면 저장하는 걸로 변경해야 한다.
    // 변경된 state.mode를 json으로 저장한다.
    // Map<String, dynamic> jsonMap = AppMode.toJson(state.mode);
    // configService.saveConfig(jsonMap);
  }
}

extension ThemeServiceExt on WidgetRef {
  AppTheme get theme => watch(themeProvider);
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppFontType get font => theme.font;
  ThemeData get themeData {
    return ThemeData(
      // 주색상 설정
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: theme.color.primary,
      ),
      scaffoldBackgroundColor: theme.color.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: theme.color.surface2,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.color.text,
        ),
        titleTextStyle: theme.font.headline2.copyWith(
          color: theme.color.text,
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: theme.color.surface2,
        indicatorColor: theme.color.primary,
        selectedIconTheme: IconThemeData(
          color: theme.color.onPrimary,
        ),
        unselectedIconTheme: IconThemeData(
          color: theme.color.unselected,
        ),
        unselectedLabelTextStyle: theme.font.subtitle2.copyWith(
          color: theme.color.unselected,
        ),
        selectedLabelTextStyle: theme.font.headline6.copyWith(
          color: theme.color.text,
        ),
      ),
    );
  }
}
