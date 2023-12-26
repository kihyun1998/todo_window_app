// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';

/// navigation bar 옆에 보여주는 main page
class MainWidget extends ConsumerWidget {
  final Widget child;
  const MainWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ref.color.surface,
          borderRadius: BorderRadius.circular(30.0),
        ),
        margin: const EdgeInsets.all(20),

        /// 실제 보여줄 위젯
        child: child,
      ),
    );
  }
}
