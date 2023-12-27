// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/intl_riverpod.dart';
import 'package:todo_window_app/src/service/navigation_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/style/component/button/button.dart';

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
          icon: const Icon(Icons.home),
          label: Text(ref.watch(intlProvider).language.home),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.star),
          label: Text(ref.watch(intlProvider).language.favorite),
        ),
      ],

      /// 하단 아이콘 배열
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ref.watch(naviProvider).isExtended

                /// isExtended가 true이면 Icon과 Text 함께 노출
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      /// 환경설정 버튼
                      Button(
                        text: ref.watch(intlProvider).language.setting,
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
                        text: ref.watch(intlProvider).language.logout,
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
