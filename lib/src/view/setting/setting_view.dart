import 'package:flutter/material.dart';
import 'package:todo_window_app/src/view/setting/widget/settingNavigationBar.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.setting)),
      body: const Row(
        children: [
          SettingNavigationBar(),
        ],
      ),
    );
  }
}
