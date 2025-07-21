import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // النصوص المترجمة
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Estaly',
      'welcome': 'Welcome back!',
      'searchProperties': 'Search Properties',
      'searchHint': 'Search for properties...',
      'categories': 'Categories',
      'villa': 'Villa',
      'apartment': 'Apartment',
      'luxury': 'Luxury',
      'office': 'Office',
      'house': 'House',
      'featuredProperties': 'Featured Properties',
      'photos': 'Photos',
      'map': 'Map',
      'getDirections': 'Get Directions',
      'openInMapsApp': 'Open in Maps app',
      'distance': 'Distance',
      'calculateFromYourLocation': 'Calculate from your location',
      'address': 'Address',
      'propertyPhotos': 'Property Photos',
      'propertyLocation': 'Property Location',
      'calculateDistance': 'Calculate Distance',
      'featureUnderDevelopment': 'This feature is under development and will be available soon.',
      'youWillBeAbleTo': 'You will be able to:',
      'seeDistanceFromCurrentLocation': '• See distance from your current location',
      'knowExpectedArrivalTime': '• Know expected arrival time',
      'choosePreferredTransport': '• Choose preferred transport method',
      'ok': 'OK',
      'close': 'Close',
      'errorOpeningMaps': 'Error opening maps app',
      'cannotOpenMapsApp': 'Cannot open maps app',
      'propertiesMap': 'Properties Map',
      'searchLocation': 'Search location...',
      'all': 'All',
      'monthlyRent': 'DH/month',
      'price': 'DH',
      'bed': 'bed',
      'bath': 'bath',
      'sqm': 'm²',
      'settings': 'Settings',
      'language': 'Language',
      'notifications': 'Notifications',
      'manageNotifications': 'Manage notifications',
      'privacy': 'Privacy',
      'privacyAndSecurity': 'Privacy and security settings',
      'helpAndSupport': 'Help & Support',
      'getHelp': 'Get help',
      'aboutApp': 'About App',
      'appInfoAndVersion': 'App information and version',
      'choosePreferredLanguage': 'Choose your preferred language',
      'home': 'Home',
      'favorites': 'Favorites',
      'search': 'Search',
      'messages': 'Messages',
      'savedProperties': 'Saved Properties',
      'allProperties': 'All Properties',
      'filterProperties': 'Filter Properties',
    },
    'ar': {
      'appTitle': 'إستالي',
      'welcome': 'أهلاً بعودتك!',
      'searchProperties': 'البحث عن العقارات',
      'searchHint': 'ابحث عن العقارات...',
      'categories': 'الفئات',
      'villa': 'فيلا',
      'apartment': 'شقة',
      'luxury': 'فاخر',
      'office': 'مكتب',
      'house': 'منزل',
      'featuredProperties': 'العقارات المميزة',
      'photos': 'الصور',
      'map': 'الخريطة',
      'getDirections': 'الحصول على الاتجاهات',
      'openInMapsApp': 'فتح في تطبيق الخرائط',
      'distance': 'المسافة',
      'calculateFromYourLocation': 'احسب من موقعك الحالي',
      'address': 'العنوان',
      'propertyPhotos': 'صور العقار',
      'propertyLocation': 'موقع العقار',
      'calculateDistance': 'حساب المسافة',
      'featureUnderDevelopment': 'هذه الميزة قيد التطوير وستكون متاحة قريباً.',
      'youWillBeAbleTo': 'ستتمكن من:',
      'seeDistanceFromCurrentLocation': '• رؤية المسافة من موقعك الحالي',
      'knowExpectedArrivalTime': '• معرفة الوقت المتوقع للوصول',
      'choosePreferredTransport': '• اختيار وسيلة النقل المفضلة',
      'ok': 'حسناً',
      'close': 'إغلاق',
      'errorOpeningMaps': 'حدث خطأ في فتح تطبيق الخرائط',
      'cannotOpenMapsApp': 'لا يمكن فتح تطبيق الخرائط',
      'propertiesMap': 'خريطة العقارات',
      'searchLocation': 'البحث عن موقع...',
      'all': 'الكل',
      'monthlyRent': 'درهم/شهر',
      'price': 'درهم',
      'bed': 'غرفة نوم',
      'bath': 'حمام',
      'sqm': 'م²',
      'settings': 'الإعدادات',
      'language': 'اللغة',
      'notifications': 'الإشعارات',
      'manageNotifications': 'إدارة الإشعارات',
      'privacy': 'الخصوصية',
      'privacyAndSecurity': 'إعدادات الخصوصية والأمان',
      'helpAndSupport': 'المساعدة والدعم',
      'getHelp': 'الحصول على المساعدة',
      'aboutApp': 'حول التطبيق',
      'appInfoAndVersion': 'معلومات التطبيق والإصدار',
      'choosePreferredLanguage': 'اختر اللغة المفضلة',
      'home': 'الرئيسية',
      'favorites': 'المفضلة',
      'search': 'البحث',
      'messages': 'الرسائل',
      'savedProperties': 'العقارات المحفوظة',
      'allProperties': 'جميع العقارات',
      'filterProperties': 'فلترة العقارات',
    },
    'fr': {
      'appTitle': 'Estaly',
      'welcome': 'Bon retour !',
      'searchProperties': 'Rechercher des Propriétés',
      'searchHint': 'Rechercher des propriétés...',
      'categories': 'Catégories',
      'villa': 'Villa',
      'apartment': 'Appartement',
      'luxury': 'Luxe',
      'office': 'Bureau',
      'house': 'Maison',
      'featuredProperties': 'Propriétés en Vedette',
      'photos': 'Photos',
      'map': 'Carte',
      'getDirections': 'Obtenir les Directions',
      'openInMapsApp': 'Ouvrir dans l\'app Cartes',
      'distance': 'Distance',
      'calculateFromYourLocation': 'Calculer depuis votre position',
      'address': 'Adresse',
      'propertyPhotos': 'Photos de la Propriété',
      'propertyLocation': 'Localisation de la Propriété',
      'calculateDistance': 'Calculer la Distance',
      'featureUnderDevelopment': 'Cette fonctionnalité est en développement et sera bientôt disponible.',
      'youWillBeAbleTo': 'Vous pourrez :',
      'seeDistanceFromCurrentLocation': '• Voir la distance depuis votre position',
      'knowExpectedArrivalTime': '• Connaître le temps d\'arrivée estimé',
      'choosePreferredTransport': '• Choisir votre moyen de transport préféré',
      'ok': 'OK',
      'close': 'Fermer',
      'errorOpeningMaps': 'Erreur lors de l\'ouverture de l\'app cartes',
      'cannotOpenMapsApp': 'Impossible d\'ouvrir l\'app cartes',
      'propertiesMap': 'Carte des Propriétés',
      'searchLocation': 'Rechercher un lieu...',
      'all': 'Tout',
      'monthlyRent': 'DH/mois',
      'price': 'DH',
      'bed': 'chambre',
      'bath': 'salle de bain',
      'sqm': 'm²',
      'settings': 'Paramètres',
      'language': 'Langue',
      'notifications': 'Notifications',
      'manageNotifications': 'Gérer les notifications',
      'privacy': 'Confidentialité',
      'privacyAndSecurity': 'Paramètres de confidentialité et sécurité',
      'helpAndSupport': 'Aide et Support',
      'getHelp': 'Obtenir de l\'aide',
      'aboutApp': 'À propos de l\'App',
      'appInfoAndVersion': 'Informations et version de l\'app',
      'choosePreferredLanguage': 'Choisissez votre langue préférée',
      'home': 'Accueil',
      'favorites': 'Favoris',
      'search': 'Recherche',
      'messages': 'Messages',
      'savedProperties': 'Propriétés Sauvegardées',
      'allProperties': 'Toutes les Propriétés',
      'filterProperties': 'Filtrer les Propriétés',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  // Getters للنصوص الشائعة
  String get appTitle => translate('appTitle');
  String get welcome => translate('welcome');
  String get searchProperties => translate('searchProperties');
  String get searchHint => translate('searchHint');
  String get categories => translate('categories');
  String get villa => translate('villa');
  String get apartment => translate('apartment');
  String get luxury => translate('luxury');
  String get office => translate('office');
  String get house => translate('house');
  String get featuredProperties => translate('featuredProperties');
  String get photos => translate('photos');
  String get map => translate('map');
  String get settings => translate('settings');
  String get language => translate('language');
  String get home => translate('home');
  String get favorites => translate('favorites');
  String get search => translate('search');
  String get messages => translate('messages');
  String get all => translate('all');
  String get ok => translate('ok');
  String get close => translate('close');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
