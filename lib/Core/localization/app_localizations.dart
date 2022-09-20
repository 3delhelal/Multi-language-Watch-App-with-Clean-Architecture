import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// This class will include the App Strings that translated with love by me
/// # Adel Helal
/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.

abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// Returns a list of localizations delegates containing this delegate `AppLocalizations.delegate` along with
  /// `GlobalMaterialLocalizations.delegate`, `GlobalCupertinoLocalizations.delegate`,
  /// and `GlobalWidgetsLocalizations.delegate`.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  ///
  /// In en, this message translates to:
  /// **'Watch App'**
  ///
  /// In ar, this message translates to:
  /// **'تطبيق شاهد'**
  String get appMainTitle;

  /// No description provided for @nowPlayingMessage.
  ///
  /// In en, this message translates to:
  /// **'NOW PLAYING'**
  ///
  /// In ar, this message translates to:
  /// **'يعرض الأن'**
  String get nowPlayingMessage;

  /// No description provided for @popularMessage.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  ///
  /// In ar, this message translates to:
  /// **'شائع مؤخرا'**
  String get popularMessage;

  /// No description provided for @topRatedMessage.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  ///
  /// In ar, this message translates to:
  /// **'أعلي التقييمات'**
  String get topRatedMessage;

  /// No description provided for @seeMoreMessage.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  ///
  /// In ar, this message translates to:
  /// **'عرض أكثر'**
  String get seeMoreMessage;

  /// No description provided for @seeMoreMessage.
  ///
  /// In en, this message translates to:
  /// **'Error occurred while feching the data'**
  ///
  /// In ar, this message translates to:
  /// **'وقع خطأ أثناء معالجة البيانات'**
  String get fechingErrorMessage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
