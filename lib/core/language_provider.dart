import 'package:flutter/material.dart';
import 'language_manager.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('ar');
  
  Locale get currentLocale => _currentLocale;
  
  String get currentLanguageCode => _currentLocale.languageCode;
  
  TextDirection get textDirection => 
      LanguageManager.getTextDirection(_currentLocale.languageCode);
  
  // تحميل اللغة المحفوظة عند بدء التطبيق
  Future<void> loadSavedLanguage() async {
    final savedLanguage = await LanguageManager.getSavedLanguage();
    _currentLocale = LanguageManager.getLocaleFromLanguageCode(savedLanguage);
    notifyListeners();
  }
  
  // تغيير اللغة
  Future<void> changeLanguage(String languageCode) async {
    if (LanguageManager.isLanguageSupported(languageCode)) {
      _currentLocale = LanguageManager.getLocaleFromLanguageCode(languageCode);
      await LanguageManager.saveLanguage(languageCode);
      notifyListeners();
    }
  }
  
  // الحصول على اسم اللغة الحالية
  String getCurrentLanguageName() {
    return LanguageManager.languageNames[_currentLocale.languageCode] ?? 'العربية';
  }
  
  // الحصول على علم اللغة الحالية
  String getCurrentLanguageFlag() {
    return LanguageManager.languageFlags[_currentLocale.languageCode] ?? '🇲🇦';
  }
}
