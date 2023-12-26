// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';

/// scaffold의 body 부분에 들어가게 될 페이지 위젯
class BodyWidget extends ConsumerWidget {
  final Widget navigationBar;
  final Widget mainPage;

  const BodyWidget({
    super.key,
    required this.navigationBar,
    required this.mainPage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: ref.color.surface2,
      child: Row(
        children: [
          navigationBar,
          mainPage,
        ],
      ),
    );
  }
}
