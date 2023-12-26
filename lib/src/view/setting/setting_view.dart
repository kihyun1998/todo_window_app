import 'package:flutter/material.dart';
import 'package:todo_window_app/src/view/setting/widgets/settingNavigationBar.dart';
import 'package:todo_window_app/src/view/widgets/bodyWidget.dart';
import 'package:todo_window_app/src/view/widgets/mainWidget.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.current.setting)),
        body: const BodyWidget(
          navigationBar: SettingNavigationBar(),
          mainPage: MainWidget(
            child: Text("test"),
          ),
        ));
  }
}
