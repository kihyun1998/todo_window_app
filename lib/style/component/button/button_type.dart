part of 'button.dart';

enum ButtonType {
  fill,
  flat,
  outline;

  /// button's text color and icon color
  Color getColor(WidgetRef ref, bool isInactive, [Color? color]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? ref.color.onInactiveContainer
            : color ?? ref.color.onPrimary;
      case ButtonType.flat:
      case ButtonType.outline:
        return isInactive ? ref.color.inactive : color ?? ref.color.primary;
    }
  }

  /// button's background color
  Color getBackgroundColor(WidgetRef ref, bool isInactive, [Color? color]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? ref.color.inactiveContainer
            : color ?? ref.color.primary;
      case ButtonType.flat:
      case ButtonType.outline:
        return color ?? Colors.transparent;
    }
  }

  /// button's border
  Border? getBorder(WidgetRef ref, bool isInactive, [Color? color]) {
    switch (this) {
      case ButtonType.fill:
      case ButtonType.flat:
        return null;
      case ButtonType.outline:
        return Border.all(
          color: getColor(ref, isInactive, color),
        );
    }
  }
}
