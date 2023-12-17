part of 'app_theme.dart';

class AppFontType {
  AppFontType({
    required this.fontType,
    required this.fontColor,
  });

  final FontType fontType;
  final Color fontColor;

  late FontWeight light = fontType.light;
  late FontWeight regular = fontType.regular;
  late FontWeight semiBold = fontType.semiBold;

  /// headline
  late final TextStyle headline1 = TextStyle(
    height: 1.3,
    fontFamily: fontType.name,
    fontWeight: fontType.semiBold,
    fontSize: 28,
    color: fontColor,
  );
  late final TextStyle headline2 = TextStyle(
    height: 1.3,
    fontFamily: fontType.name,
    fontWeight: fontType.semiBold,
    fontSize: 24,
    color: fontColor,
  );
  late final TextStyle headline3 = TextStyle(
    height: 1.3,
    fontFamily: fontType.name,
    fontWeight: fontType.semiBold,
    fontSize: 21,
    color: fontColor,
  );
  late final TextStyle headline4 = TextStyle(
    height: 1.3,
    fontFamily: fontType.name,
    fontWeight: fontType.semiBold,
    fontSize: 20,
    color: fontColor,
  );
  late final TextStyle headline5 = TextStyle(
    height: 1.3,
    fontFamily: fontType.name,
    fontWeight: fontType.semiBold,
    fontSize: 19,
    color: fontColor,
  );
  late final TextStyle headline6 = TextStyle(
    height: 1.3,
    fontFamily: fontType.name,
    fontWeight: fontType.semiBold,
    fontSize: 18,
    color: fontColor,
  );

  // subtitle
  late final TextStyle subtitle1 = TextStyle(
    height: 1.3,
    fontFamily: fontType.name,
    fontWeight: fontType.regular,
    fontSize: 16,
    color: fontColor,
  );
  late final TextStyle subtitle2 = TextStyle(
    height: 1.3,
    fontFamily: fontType.name,
    fontWeight: fontType.regular,
    fontSize: 15,
    color: fontColor,
  );

  /// body
  late final TextStyle body1 = TextStyle(
    height: 1.3,
    fontFamily: fontType.name,
    fontWeight: fontType.regular,
    fontSize: 14,
    color: fontColor,
  );
  late final TextStyle body2 = TextStyle(
    height: 1.3,
    fontFamily: fontType.name,
    fontWeight: fontType.regular,
    fontSize: 12,
    color: fontColor,
  );
}
