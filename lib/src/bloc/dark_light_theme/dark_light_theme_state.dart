// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dark_light_theme_bloc.dart';

@immutable
class DarkLightThemeState extends Equatable {
  DarkLightThemeState({
    AppTheme? theme,
  }) : theme = theme ?? LightTheme();

  final AppTheme theme;

  @override
  List<Object?> get props => [theme];
}
