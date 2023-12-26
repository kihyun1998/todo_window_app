import 'package:flutter/material.dart';
import 'package:todo_window_app/src/view/setting/widgets/settingNavigationBar.dart';
import 'package:todo_window_app/src/view/setting/widgets/settingTile.dart';
import 'package:todo_window_app/src/view/widgets/bodyWidget.dart';
import 'package:todo_window_app/src/view/widgets/mainWidget.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.setting)),
      body: BodyWidget(
        navigationBar: const SettingNavigationBar(), //커스텀 세팅 네비게이션 바
        mainPage: MainWidget(
            child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return SettingTile(
              icon: 'theme',
              title: 'theme',
              subtitle: 'theme',
              onPressed: () {},
            );
          },
        )),
      ),
    );
  }
}
