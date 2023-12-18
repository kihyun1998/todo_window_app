// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_window_app/style/dart_theme.dart';
import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/style/light_theme.dart';

part 'dark_light_theme_event.dart';
part 'dark_light_theme_state.dart';

class DarkLightThemeBloc
    extends Bloc<DarkLightThemeEvent, DarkLightThemeState> {
  DarkLightThemeBloc() : super(DarkLightThemeState(theme: LightTheme())) {
    on<ToggleTheme>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleTheme event, emit) {
    state.theme.brightness == Brightness.light
        ? emit(
            DarkLightThemeState(
              theme: DarkTheme(),
            ),
          )
        : emit(
            DarkLightThemeState(
              theme: LightTheme(),
            ),
          );
  }
}
