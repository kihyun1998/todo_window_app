part of 'button.dart';

enum ButtonSize {
  small,
  medium,
  large;

  /// about button's padding
  double get padding {
    switch (this) {
      case ButtonSize.small:
        return 16;
      case ButtonSize.medium:
        return 12;
      case ButtonSize.large:
        return 8;
    }
  }

  /// about button's font-style
  TextStyle getTextStyle(WidgetRef ref) {
    switch (this) {
      case ButtonSize.small:
        return ref.font.subtitle2;
      case ButtonSize.medium:
        return ref.font.subtitle1;
      case ButtonSize.large:
        return ref.font.headline6;
    }
  }
}
