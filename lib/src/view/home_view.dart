import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/src/view/widget/mainNavigationBar.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.todolist),
        ),
        // drawer: const Drawer(),
        body: ColoredBox(
          color: ref.color.surface2,
          child: Row(
            children: [
              const MainNavigationBar(),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ref.color.surface,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  margin: const EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: ref.watch(themeProvider.notifier).toggleTheme,
                    child: Text(
                      S.current.theme,
                      style: ref.font.headline6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
