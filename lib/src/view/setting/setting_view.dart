import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/intl_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/src/view/setting/widgets/settingNavigationBar.dart';
import 'package:todo_window_app/src/view/setting/widgets/settingTile.dart';
import 'package:todo_window_app/src/view/widgets/bodyWidget.dart';
import 'package:todo_window_app/src/view/widgets/mainWidget.dart';
import 'package:todo_window_app/util/helper/intl_helper.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final LangRiverpod langService = ref.watch(langProvider.notifier);
    final S s = ref.watch(intlProvider).language;

    /// 세팅 아이템
    final List<SettingTile> globalSetting = [
      /// 테마 설정
      SettingTile(
        icon: 'theme',
        title: S.current.theme,
        subtitle: ref.watch(themeProvider).brightness == Brightness.light
            ? S.current.light
            : S.current.dark,
        onPressed: ref.read(themeProvider.notifier).toggleTheme,
      ),
      SettingTile(
        icon: 'language',
        title: S.current.language,
        subtitle: ref.watch(intlProvider).locale == IntlHelper.en ? s.en : s.ko,
        // subtitle: ref.watch(langProvider) == IntlHelper.en
        // ? S.current.en
        // : S.current.ko,
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
