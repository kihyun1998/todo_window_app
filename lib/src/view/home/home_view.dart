// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/src/view/home/widgets/mainNavigationBar.dart';
import 'package:todo_window_app/src/view/widgets/bodyWidget.dart';
import 'package:todo_window_app/src/view/widgets/mainWidget.dart';
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
        body: BodyWidget(
          navigationBar: const MainNavigationBar(),
          mainPage: MainWidget(
            child: TextButton(
              onPressed: ref.watch(themeProvider.notifier).toggleTheme,
              child: Text(
                S.current.theme,
                style: ref.font.headline6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
