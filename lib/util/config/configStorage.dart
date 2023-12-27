import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ConfigStorage {
  /// directory는 /Users/User/AppData/Roaming/[패키지이름]/[프로젝트이름]
  Future<String> get _localPath async {
    final directory = await getApplicationSupportDirectory();
    return directory.path;
  }

  /// directory 경로 밑에 config.json 파일
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/config.json');
  }

  /// Json 파일 읽기
  /// toString은 밖에서 읽어서 하는거로
  Future<Map<String, dynamic>> readConfig() async {
    try {
      final file = await _localFile;
      if (!file.existsSync()) {
        // 설정파일 존재하지 않으면 빈 값 반환
        return {};
      }
      // 설정파일 있으면 읽어서 json 디코딩
      // [ToDo] : 추후에 무결성 검증 동작 추가 필요
      String data = await file.readAsString();
      return json.decode(data);
    } catch (e) {
      // 모르는 에러 발생 시 빈 값 반환
      return {};
    }
  }

  /// 설정 파일 jsonString으로 작성
  /// 파일에 저장된 값은 string이다.
  Future<File> writeConfig(Map<String, dynamic> jsonMap) async {
    final file = await _localFile;

    // json 객체를 string으로 변환 후 파일에 작성
    String jsonString = json.encode(jsonMap);
    return file.writeAsString(jsonString);
  }
}
