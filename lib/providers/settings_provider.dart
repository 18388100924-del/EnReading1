import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  Color _backgroundColor = Colors.white;
  double _fontSize = 16.0;
  bool _showChineseDefinition = false;

  Color get backgroundColor => _backgroundColor;
  double get fontSize => _fontSize;
  bool get showChineseDefinition => _showChineseDefinition;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _backgroundColor = Color(prefs.getInt('backgroundColor') ?? Colors.white.value);
    _fontSize = prefs.getDouble('fontSize') ?? 16.0;
    _showChineseDefinition = prefs.getBool('showChineseDefinition') ?? false;
    notifyListeners();
  }

  Future<void> setBackgroundColor(Color color) async {
    _backgroundColor = color;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('backgroundColor', color.value);
    notifyListeners();
  }

  Future<void> setFontSize(double size) async {
    _fontSize = size;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', size);
    notifyListeners();
  }

  void toggleDefinitionLanguage() {
    _showChineseDefinition = !_showChineseDefinition;
    notifyListeners();
  }
}
