import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/style/component/button/button.dart';
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
          leading: Button(
            width: 40,
            icon: 'menu',
            type: ButtonType.flat,
            size: ButtonSize.small,
            onPressed: () {},
          ),
          title: Text(S.current.todolist),
        ),
        // drawer: const Drawer(),
        body: ColoredBox(
          color: ref.color.surface2,
          child: Row(
            children: [
              NavigationRail(
                selectedIndex: index,
                onDestinationSelected: (index) => setState(() {
                  this.index = index;
                }),
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text("home"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text("setting"),
                  ),
                ],
              ),
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
