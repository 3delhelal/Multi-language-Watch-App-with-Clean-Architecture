import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appMainTitle => 'Watch App';

  @override
  String get nowPlayingMessage => 'NOW PLAYING';

  @override
  String get popularMessage => 'Popular';

  @override
  String get topRatedMessage => 'Top Rated';

  @override
  String get seeMoreMessage => 'See More';

  @override
  String get fechingErrorMessage => 'Error occurred while feching the data';
}
