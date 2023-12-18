import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_window_app/src/bloc/dark_light_theme/dark_light_theme_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkLightThemeBloc, DarkLightThemeState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Center(
            child: TextButton(
              onPressed: context.read(),
              child: const Text("ToDo Window App"),
            ),
          ),
        );
      },
    );
  }
}
