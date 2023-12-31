import 'package:flutter/material.dart';
import 'package:todo_window_app/style/foundation/app_mode.dart';
import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/style/resource/fontType.dart';
import 'package:todo_window_app/style/resource/palette.dart';

class DarkTheme implements AppTheme {
  @override
  AppMode mode = AppMode.dark;

  @override
  AppColor color = AppColor(
    surface: Palette.grey800,
    surface2: Palette.grey850,
    background: Palette.black.withOpacity(0.55),
    text: Palette.grey100,
    subtext: Palette.grey500,
    toastContainer: Palette.grey100.withOpacity(0.85),
    onToastContainer: Palette.grey800,
    hint: Palette.grey600,
    hintContainer: Palette.grey770,
    onHintContainer: Palette.grey350,
    inactive: Palette.grey500,
    inactiveContainer: Palette.grey700,
    onInactiveContainer: Palette.grey400,
    primary: Palette.blue,
    onPrimary: Palette.white,
    secondary: Palette.grey,
    onSecondary: Palette.white,
    tertiary: Palette.red,
    onTertiary: Palette.white,
    quaternary: Palette.green,
    onQuaternary: Palette.white,
    unselected: Palette.grey600,
  );

  @override
  late AppFontType font = AppFontType(
    fontType: const NotoSans(),
    fontColor: color.text,
  );

  @override
  AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.35),
        blurRadius: 35,
      ),
    ],
  );
}
