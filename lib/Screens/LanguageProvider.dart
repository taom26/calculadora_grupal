// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  String _language = 'Español';

  String get language => _language;

  LanguageProvider() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _language = prefs.getString('language') ?? 'Español';
    notifyListeners();
  }

  void setLanguage(String language) {
    _language = language;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('language', _language);
    });
    notifyListeners();
  }
}
