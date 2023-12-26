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

      /// 상단 아이콘 배열

      /// 네비게이션 아이콘 배열
      destinations: const [
        /// 홈 아이콘
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text("Home"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.star),
          label: Text("Favorite"),
        ),
      ],

      /// 하단 아이콘 배열
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ref.watch(naviProvider).isExtended
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      /// 환경설정 버튼
                      Button(
                        text: S.current.setting,
                        icon: 'setting',
                        color: ref.theme.color.onSecondary,
                        backgroundColor: ref.theme.color.secondary,
                        iconSize: 24,
                        size: ButtonSize.small,
                        onPressed: () {
                          // 환경설정 페이지로 이동
                          Navigator.pushNamed(context, 'setting');
                        },
                      ),
                      const SizedBox(height: 10),

                      /// 로그아웃 버튼
                      Button(
                        text: S.current.logout,
                        icon: 'logout',
                        color: ref.theme.color.onTertiary,
                        backgroundColor: ref.theme.color.tertiary,
                        iconSize: 24,
                        size: ButtonSize.small,
                        onPressed: () {},
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      /// 환경설정 버튼
                      Button(
                        icon: 'setting',
                        color: ref.theme.color.onSecondary,
                        backgroundColor: ref.theme.color.secondary,
                        iconSize: 24,
                        size: ButtonSize.small,
                        onPressed: () {
                          // 환경설정 페이지로 이동
                          Navigator.pushNamed(context, 'setting');
                        },
                      ),
                      const SizedBox(height: 10),

                      /// 로그아웃 버튼
                      Button(
                        icon: 'logout',
                        color: ref.theme.color.onTertiary,
                        backgroundColor: ref.theme.color.tertiary,
                        iconSize: 24,
                        size: ButtonSize.small,
                        onPressed: () {},
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
