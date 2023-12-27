import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/intl_riverpod.dart';
import 'package:todo_window_app/src/service/navigation_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/style/component/button/button.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class SettingNavigationBar extends ConsumerWidget {
  const SettingNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final S s = ref.watch(intlProvider).language;

    return NavigationRail(
      selectedIndex: ref.watch(naviProvider).index,
      onDestinationSelected: (newIndex) {
        ref.read(naviProvider.notifier).onDestinationSelected(newIndex);
      },
      extended: ref.watch(naviProvider).isExtended,
      labelType: NavigationRailLabelType.none,

      /// 상단 아이콘 배열
      leading: ref.watch(naviProvider).isExtended
          ? Button(
              color: ref.theme.color.text,
              iconSize: 15,
              icon: 'close-side',
              type: ButtonType.flat,
              size: ButtonSize.small,
              onPressed: ref.read(naviProvider.notifier).toggleExtended,
            )
          : Button(
              color: ref.theme.color.text,
              iconSize: 15,
              icon: 'open-side',
              type: ButtonType.flat,
              size: ButtonSize.small,
              onPressed: ref.read(naviProvider.notifier).toggleExtended,
            ),

      /// 네비게이션 아이콘 배열
      destinations: [
        /// 홈 아이콘
        NavigationRailDestination(
          icon: const Icon(Icons.tune),
          label: Text(s.basic),
        ),
        // label: Text(S.current.basic),
        NavigationRailDestination(
          icon: const Icon(Icons.terminal),
          label: Text(s.program),
          // label: Text(S.current.program),
        ),
      ],
    );
  }
}
