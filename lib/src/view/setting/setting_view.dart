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
    final List<SettingTile> globalConfigList = [
      SettingTile(
        icon: 'theme',
        title: "Theme",
        subtitle: "Theme",
        onPressed: () {},
      ),
      SettingTile(
        icon: 'theme',
        title: "Theme",
        subtitle: "Theme",
        onPressed: () {},
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(S.current.setting)),
      body: BodyWidget(
        navigationBar: const SettingNavigationBar(),
        mainPage: MainWidget(
          child: ListView.builder(
            itemCount: globalConfigList.length,
            itemBuilder: (context, index) {
              return globalConfigList[index];
            },
          ),
        ),
      ),
    );
  }
}
