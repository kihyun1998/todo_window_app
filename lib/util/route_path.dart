import 'package:flutter/material.dart';
import 'package:todo_window_app/src/view/home_view.dart';
import 'package:todo_window_app/src/view/setting_view.dart';

abstract class RoutePath {
  static const String main = 'main';
  static const String setting = 'setting';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late final Widget page;
    switch (settings.name) {
      case RoutePath.setting:
        page = const SettingPage();
        break;
      case RoutePath.main:
        page = const HomePage();
        break;
    }
    return MaterialPageRoute(builder: (context) => page);
  }
}
