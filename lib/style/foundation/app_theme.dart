import 'package:flutter/material.dart';
import 'package:todo_window_app/style/foundation/app_mode.dart';
import 'package:todo_window_app/style/resource/fontType.dart';

part 'app_color.dart';
part 'app_deco.dart';
part 'app_fontType.dart';

abstract class AppTheme {
  late final AppMode mode;
  late final AppColor color;
  late final AppDeco deco;
  late final AppFontType font;
}
