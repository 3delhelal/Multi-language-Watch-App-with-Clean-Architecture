import 'app_localizations.dart';

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appMainTitle => 'تطبيق شاهد';

  @override
  String get nowPlayingMessage => 'يعرض الأن';

  @override
  String get popularMessage => 'شائع مؤخرا';

  @override
  String get topRatedMessage => 'أعلي التقييمات';

  @override
  String get seeMoreMessage => 'عرض أكثر';

  @override
  String get fechingErrorMessage => 'وقع خطأ أثناء معالجة البيانات';
}
