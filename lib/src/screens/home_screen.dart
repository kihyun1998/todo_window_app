import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: ref.watch(themeProvider.notifier).toggleTheme,
          child: Text(
            S.current.theme,
            style: ref.font.headline6,
          ),
        ),
      ),
    );
  }
}
