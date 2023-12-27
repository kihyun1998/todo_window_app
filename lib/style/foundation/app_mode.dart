enum AppMode {
  dark,
  light;

  static Map<String, dynamic> toJson(AppMode mode) {
    String modeString = mode.toString().split('.').last;
    return {'AppMode': modeString};
  }
}
