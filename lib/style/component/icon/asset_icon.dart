import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';

class AssetIcon extends ConsumerWidget {
  const AssetIcon({
    super.key,
    required this.icon,
    this.color,
    this.size,
  });

  final String icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SvgPicture.asset(
      'assets/icons/$icon.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        color ?? ref.color.text,
        BlendMode.srcIn,
      ),
    );
  }
}
