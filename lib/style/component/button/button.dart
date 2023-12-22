import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/service/theme_riverpod.dart';
import 'package:todo_window_app/style/component/icon/asset_icon.dart';

part 'button_size.dart';
part 'button_type.dart';

// 여기서는 어쩔 수 없이 StatefulWidget 사용 못하고 ConsumerStatefulWidget써야 한다.
class Button extends ConsumerStatefulWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.color,
    this.backgroundColor,
    this.borderColer,
    this.width,
    ButtonType? type,
    ButtonSize? size,
    bool? isInactive,
  })  : type = type ?? ButtonType.fill, // 기본 타입 fill
        size = size ?? ButtonSize.medium, // 기본 사이즈 medium
        isInactive = isInactive ?? false; // 기본 비활성 여부 false

  final void Function() onPressed;

  final ButtonType type; // 버튼 타입(fill, flat, outline)
  final ButtonSize size; // 버튼 사이즈(small, medium, large)

  final bool isInactive; // 활성 비활성 여부

  final String? text; // 텍스트
  final String? icon; // 아이콘

  final double? width; // 폭

  final Color? color; // 버튼 색
  final Color? backgroundColor; // 버튼 배경 색
  final Color? borderColer; // 버튼 테두리 색

  @override
  ConsumerState<Button> createState() => _ButtonState();
}

class _ButtonState extends ConsumerState<Button> {
  bool isPressed = false; // 버튼 눌려있는지 여부

  /// 버튼이 눌려져 있거나 isInactive true면 true 반환
  bool get isInactive => isPressed || widget.isInactive;

  /// 버튼의 Text와 Icon 색 가져오기
  Color get color => widget.type.getColor(
        ref,
        isInactive,
        widget.color,
      );

  /// 버튼의 배경색 가져오기
  Color get backgroundColor => widget.type.getBackgroundColor(
        ref,
        isInactive,
        widget.backgroundColor,
      );

  /// 버튼의 테두리 타입 가져오기
  Border? get border => widget.type.getBorder(
        ref,
        isInactive,
        widget.borderColer,
      );

  /// 버튼 클릭 이벤트
  void onPressed(bool newIsPRessed) {
    if (isPressed == newIsPRessed) return;
    setState(() {
      isPressed = newIsPRessed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        onPressed(false);
        if (!widget.isInactive) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => onPressed(true),
      onTapCancel: () => onPressed(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: border,
        ),
        padding: EdgeInsets.all(widget.size.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// for Icon
            if (widget.icon != null)
              AssetIcon(
                icon: widget.icon!,
                color: color,
              ),

            /// for Gap
            if (widget.icon != null && widget.text != null)
              const SizedBox(width: 8),

            /// for Text
            if (widget.text != null)
              Text(
                widget.text!,
                style: widget.size.getTextStyle(ref).copyWith(
                      color: color,
                      fontWeight: ref.font.semiBold,
                    ),
              )
          ],
        ),
      ),
    );
  }
}
