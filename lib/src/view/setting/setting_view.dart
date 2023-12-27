import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/src/view/setting/widgets/settingNavigationBar.dart';
import 'package:todo_window_app/src/view/setting/widgets/settingTile.dart';
import 'package:todo_window_app/src/view/widgets/bodyWidget.dart';
import 'package:todo_window_app/src/view/widgets/mainWidget.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 세팅 아이템
    final List<SettingTile> globalSetting = [
      /// 테마 설정
      SettingTile(
        icon: 'theme',
        title: 'Theme',
        subtitle: ref.watch(themeProvider).brightness == Brightness.light
            ? S.current.light
            : S.current.dark,
        onPressed: ref.read(themeProvider.notifier).toggleTheme,
      ),
      SettingTile(
        icon: 'language',
        title: 'language',
        subtitle: 'language',
        onPressed: () {},
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(S.current.setting)),
      body: BodyWidget(
        navigationBar: const SettingNavigationBar(), //커스텀 세팅 네비게이션 바
        mainPage: MainWidget(
          child: ListView.separated(
            itemCount: globalSetting.length,
            itemBuilder: (context, index) {
              return globalSetting[index];
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
          ),
        ),
      ),
    );
  }
}
