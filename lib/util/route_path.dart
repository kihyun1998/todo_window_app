import 'package:flutter/material.dart';
import 'package:todo_window_app/src/pages/home_page.dart';
import 'package:todo_window_app/src/pages/setting_page.dart';

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
