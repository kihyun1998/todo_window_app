import 'package:flutter/material.dart';
import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/style/resource/fontType.dart';
import 'package:todo_window_app/style/resource/palette.dart';

class LightTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.light;

  @override
  AppColor color = AppColor(
    surface: Palette.grey100,
    surface2: Palette.grey200,
    background: Palette.black.withOpacity(0.55),
    text: Palette.black,
    subtext: Palette.grey700,
    toastContainer: Palette.black.withOpacity(0.85),
    onToastContainer: Palette.grey100,
    hint: Palette.grey300,
    hintContainer: Palette.grey150,
    onHintContainer: Palette.grey500,
    inactive: Palette.grey400,
    inactiveContainer: Palette.grey250,
    onInactiveContainer: Palette.white,
    primary: Palette.navy,
    onPrimary: Palette.white,
    secondary: Palette.red,
    onSecondary: Palette.white,
    tertiary: Palette.yellow,
    onTertiary: Palette.white,
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
        color: Palette.black.withOpacity(0.1),
        blurRadius: 35,
      ),
    ],
  );
}
