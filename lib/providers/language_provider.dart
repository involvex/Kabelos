import 'package:flutter/material.dart';
import '../services/data_manager.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _locale;
  String _currentLanguageCode = 'system';

  Locale? get locale => _locale;
  String get currentLanguage => _currentLanguageCode;

  LanguageProvider() {
    _loadLanguage();
  }

  void _loadLanguage() async {
    final dataManager = DataManager.instance;
    final languageCode = await dataManager.getString('language_code');
    if (languageCode != null) {
      _locale = Locale(languageCode);
      _currentLanguageCode = languageCode;
      notifyListeners();
    } else {
      _currentLanguageCode = 'system';
      notifyListeners();
    }
  }

  void setLanguage(String languageCode) async {
    if (languageCode == 'system' || languageCode.isEmpty) {
      _locale = null;
      _currentLanguageCode = 'system';
    } else {
      _locale = Locale(languageCode);
      _currentLanguageCode = languageCode;
    }
    await DataManager.instance.setString('language_code', languageCode);
    notifyListeners();
  }

  void clearLanguage() async {
    _locale = null;
    _currentLanguageCode = 'system';
    await DataManager.instance.remove('language_code');
    notifyListeners();
  }
}
