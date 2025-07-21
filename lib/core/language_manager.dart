import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageManager {
  static const String _languageKey = 'selected_language';
  
  // اللغات المدعومة
  static const List<Locale> supportedLocales = [
    Locale('ar'), // العربية
    Locale('en'), // الإنجليزية
    Locale('fr'), // الفرنسية
  ];
  
  // أسماء اللغات للعرض
  static const Map<String, String> languageNames = {
    'ar': 'العربية',
    'en': 'English',
    'fr': 'Français',
  };
  
  // أيقونات اللغات
  static const Map<String, String> languageFlags = {
    'ar': '🇲🇦', // المغرب
    'en': '🇺🇸', // أمريكا
    'fr': '🇫🇷', // فرنسا
  };
  
  // حفظ اللغة المختارة
  static Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }
  
  // استرجاع اللغة المحفوظة
  static Future<String> getSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'ar'; // العربية كلغة افتراضية
  }
  
  // تحويل كود اللغة إلى Locale
  static Locale getLocaleFromLanguageCode(String languageCode) {
    return Locale(languageCode);
  }
  
  // التحقق من دعم اللغة
  static bool isLanguageSupported(String languageCode) {
    return supportedLocales.any((locale) => locale.languageCode == languageCode);
  }
  
  // الحصول على اتجاه النص للغة
  static TextDirection getTextDirection(String languageCode) {
    return languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
  }
}
