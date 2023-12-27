// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/intl_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/src/view/home/widgets/mainNavigationBar.dart';
import 'package:todo_window_app/src/view/widgets/bodyWidget.dart';
import 'package:todo_window_app/src/view/widgets/mainWidget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  void re() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) => Scaffold(
        appBar: AppBar(
          title: Text(ref.watch(intlProvider).language.todolist),
        ),
        body: BodyWidget(
          navigationBar: const MainNavigationBar(),
          mainPage: MainWidget(
            child: TextButton(
              onPressed: ref.watch(themeProvider.notifier).toggleTheme,
              child: Text(
                ref.watch(intlProvider).language.theme,
                style: ref.font.headline6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
