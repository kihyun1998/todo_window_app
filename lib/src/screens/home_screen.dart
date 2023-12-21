import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/riverpod_theme.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.color.surface,
      body: Center(
        child: TextButton(
          onPressed: ref.watch(themeProvider.notifier).toggleTheme,
          child: Text(
            "ToDo Window App",
            style: ref.font.headline6,
          ),
        ),
      ),
    );
  }
}
