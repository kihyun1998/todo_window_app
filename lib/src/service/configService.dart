import 'package:todo_window_app/style/foundation/app_mode.dart';
import 'package:todo_window_app/util/config/configStorage.dart';

class ConfigService {
  final ConfigStorage _storage = ConfigStorage();

  Future<void> saveConfig(Map<String, dynamic> jsonMap) async {
    await _storage.writeConfig(jsonMap);
  }

  Future<String> _readAppModeString() async {
    Map<String, dynamic> jsonData = await _storage.readConfig();

    /// mode가 null이면 light가 default
    return jsonData['AppMode'] ?? "light";
  }

  Future<AppMode> appModeFromJson() async {
    String modeString = await _readAppModeString();
    switch (modeString) {
      case 'dark':
        return AppMode.dark;
      case 'light':
      default:
        return AppMode.light;
    }
  }
}
