import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/intl_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/src/view/setting/widgets/settingNavigationBar.dart';
import 'package:todo_window_app/src/view/setting/widgets/settingTile.dart';
import 'package:todo_window_app/src/view/widgets/bodyWidget.dart';
import 'package:todo_window_app/src/view/widgets/mainWidget.dart';
import 'package:todo_window_app/style/foundation/app_mode.dart';
import 'package:todo_window_app/util/helper/intl_helper.dart';
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
        title: ref.watch(intlProvider).language.theme,
        subtitle: ref.watch(themeProvider).mode == AppMode.light
            ? ref.watch(intlProvider).language.light
            : ref.watch(intlProvider).language.dark,
        onPressed: ref.read(themeProvider.notifier).toggleTheme,
      ),
      SettingTile(
        icon: 'language',
        title: ref.watch(intlProvider).language.language,
        subtitle: ref.watch(intlProvider).locale == IntlHelper.en
            ? ref.watch(intlProvider).language.en
            : ref.watch(intlProvider).language.ko,
        onPressed: ref.read(intlProvider.notifier).toggleLanguage,
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
              return Divider(
                height: 20,
                thickness: 1,
                indent: 50,
                endIndent: 50,
                color: ref.theme.color.text,
              );
            },
          ),
        ),
      ),
    );
  }
}
