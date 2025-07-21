import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Estaly'**
  String get appTitle;

  /// Welcome message
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcome;

  /// Search properties text
  ///
  /// In en, this message translates to:
  /// **'Search Properties'**
  String get searchProperties;

  /// Search input hint
  ///
  /// In en, this message translates to:
  /// **'Search for properties...'**
  String get searchHint;

  /// Categories section title
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// Villa category
  ///
  /// In en, this message translates to:
  /// **'Villa'**
  String get villa;

  /// Apartment category
  ///
  /// In en, this message translates to:
  /// **'Apartment'**
  String get apartment;

  /// Luxury category
  ///
  /// In en, this message translates to:
  /// **'Luxury'**
  String get luxury;

  /// Office category
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get office;

  /// Featured properties section title
  ///
  /// In en, this message translates to:
  /// **'Featured Properties'**
  String get featuredProperties;

  /// Photos button text
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get photos;

  /// Map button text
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// Get directions button text
  ///
  /// In en, this message translates to:
  /// **'Get Directions'**
  String get getDirections;

  /// Open in maps app description
  ///
  /// In en, this message translates to:
  /// **'Open in Maps app'**
  String get openInMapsApp;

  /// Distance text
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// Calculate distance description
  ///
  /// In en, this message translates to:
  /// **'Calculate from your location'**
  String get calculateFromYourLocation;

  /// Address text
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Property photos title
  ///
  /// In en, this message translates to:
  /// **'Property Photos'**
  String get propertyPhotos;

  /// Property location title
  ///
  /// In en, this message translates to:
  /// **'Property Location'**
  String get propertyLocation;

  /// Property location map text
  ///
  /// In en, this message translates to:
  /// **'Property Location Map'**
  String get propertyLocationMap;

  /// Calculate distance dialog title
  ///
  /// In en, this message translates to:
  /// **'Calculate Distance'**
  String get calculateDistance;

  /// Feature under development message
  ///
  /// In en, this message translates to:
  /// **'This feature is under development and will be available soon.'**
  String get featureUnderDevelopment;

  /// Future features intro
  ///
  /// In en, this message translates to:
  /// **'You will be able to:'**
  String get youWillBeAbleTo;

  /// Future feature description
  ///
  /// In en, this message translates to:
  /// **'• See distance from your current location'**
  String get seeDistanceFromCurrentLocation;

  /// Future feature description
  ///
  /// In en, this message translates to:
  /// **'• Know expected arrival time'**
  String get knowExpectedArrivalTime;

  /// Future feature description
  ///
  /// In en, this message translates to:
  /// **'• Choose preferred transport method'**
  String get choosePreferredTransport;

  /// OK button text
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Close button text
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Error message when maps app fails to open
  ///
  /// In en, this message translates to:
  /// **'Error opening maps app'**
  String get errorOpeningMaps;

  /// Error message when maps app is not available
  ///
  /// In en, this message translates to:
  /// **'Cannot open maps app'**
  String get cannotOpenMapsApp;

  /// Properties map screen title
  ///
  /// In en, this message translates to:
  /// **'Properties Map'**
  String get propertiesMap;

  /// Search location hint in map
  ///
  /// In en, this message translates to:
  /// **'Search location...'**
  String get searchLocation;

  /// Interactive map placeholder text
  ///
  /// In en, this message translates to:
  /// **'Interactive Map'**
  String get interactiveMap;

  /// Map placeholder description
  ///
  /// In en, this message translates to:
  /// **'Properties locations will be shown here'**
  String get propertiesLocationsWillBeShownHere;

  /// All filter option
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// House category
  ///
  /// In en, this message translates to:
  /// **'House'**
  String get house;

  /// Monthly rent suffix
  ///
  /// In en, this message translates to:
  /// **'DH/month'**
  String get monthlyRent;

  /// Price suffix
  ///
  /// In en, this message translates to:
  /// **'DH'**
  String get price;

  /// Bedroom count suffix
  ///
  /// In en, this message translates to:
  /// **'bed'**
  String get bed;

  /// Bathroom count suffix
  ///
  /// In en, this message translates to:
  /// **'bath'**
  String get bath;

  /// Square meter unit
  ///
  /// In en, this message translates to:
  /// **'m²'**
  String get sqm;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
