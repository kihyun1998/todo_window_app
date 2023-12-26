import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/navigation_riverpod.dart';
import 'package:todo_window_app/style/component/button/button.dart';

class SettingNavigationBar extends ConsumerWidget {
  const SettingNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              iconSize: 20,
              icon: 'close-menu',
              type: ButtonType.flat,
              size: ButtonSize.small,
              onPressed: ref.read(naviProvider.notifier).toggleExtended,
            )
          : Button(
              iconSize: 20,
              icon: 'open-menu',
              type: ButtonType.flat,
              size: ButtonSize.small,
              onPressed: ref.read(naviProvider.notifier).toggleExtended,
            ),

      /// 네비게이션 아이콘 배열
      destinations: const [
        /// 홈 아이콘
        NavigationRailDestination(
          icon: Icon(Icons.public),
          label: Text("Global"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.terminal),
          label: Text("Programs"),
        ),
      ],
    );
  }
}
