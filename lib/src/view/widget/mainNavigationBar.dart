import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/navigation_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/style/component/button/button.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

class MainNavigationBar extends ConsumerWidget {
  const MainNavigationBar({
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
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text("Home"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text("Setting"),
        ),
      ],
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ref.watch(naviProvider).isExtended
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button(
                        size: ButtonSize.small,
                        color: ref.theme.color.onSecondary,
                        backgroundColor: ref.theme.color.secondary,
                        onPressed: () {
                          Navigator.pushNamed(context, 'setting');
                        },
                        icon: 'setting',
                        text: S.current.setting,
                      ),
                      const SizedBox(height: 10),
                      Button(
                        onPressed: () {},
                        size: ButtonSize.small,
                        icon: 'logout',
                        text: S.current.logout,
                        color: ref.theme.color.onTertiary,
                        backgroundColor: ref.theme.color.tertiary,
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button(
                        size: ButtonSize.small,
                        onPressed: () {},
                        icon: 'setting',
                        color: ref.theme.color.onSecondary,
                        backgroundColor: ref.theme.color.secondary,
                      ),
                      const SizedBox(height: 10),
                      Button(
                        onPressed: () {},
                        size: ButtonSize.small,
                        icon: 'logout',
                        color: ref.theme.color.onTertiary,
                        backgroundColor: ref.theme.color.tertiary,
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}