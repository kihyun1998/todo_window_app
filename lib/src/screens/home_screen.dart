import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/style/component/button/button.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) => Scaffold(
        appBar: AppBar(
          leading: Button(
            width: 24,
            icon: 'menu',
            type: ButtonType.flat,
            size: ButtonSize.small,
            onPressed: () {},
          ),
          title: Text(S.current.todolist),
          actions: [
            Button(
              icon: 'setting',
              type: ButtonType.flat,
              size: ButtonSize.small,
              onPressed: () {},
            )
          ],
        ),
        // drawer: const Drawer(),
        body: Center(
          child: TextButton(
            onPressed: ref.watch(themeProvider.notifier).toggleTheme,
            child: Text(
              S.current.theme,
              style: ref.font.headline6,
            ),
          ),
        ),
      ),
    );
  }
}
