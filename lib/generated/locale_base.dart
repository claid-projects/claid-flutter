import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  Map<String, dynamic> _data;
  String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }

  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  Localelanguages _languages;
  Localelanguages get languages => _languages;

  void initAll() {
    _languages = Localelanguages(Map<String, String>.from(_data['languages']));
  }
}

class Localelanguages {
  final Map<String, String> _data;
  Localelanguages(this._data);

  String get login => _data["Login"];
}
