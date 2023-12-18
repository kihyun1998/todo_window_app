// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dark_light_theme_bloc.dart';

@immutable
sealed class DarkLightThemeEvent {}

class ToggleTheme extends DarkLightThemeEvent {
  final AppTheme theme;

  ToggleTheme({
    required this.theme,
  });
}
