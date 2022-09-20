import 'Core/localization/app_localizations.dart';
import '/Core/services/services_locator.dart';
import '/Core/theme/temporary_theme.dart';
import '/Moves/presentation/screens/movie/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Moves/data/datasource/base_move_remote_date_source.dart';
import 'Moves/presentation/controllers/moviebloc/movies_bloc.dart';
import 'Moves/presentation/controllers/moviebloc/movies_events.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context).appMainTitle,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        localeResolutionCallback: handlingAppLocaleMethod,
        // TODO Add Language Bloc
        debugShowCheckedModeBanner: false,
        theme: tempTheme(),
        home: BlocProvider<MoviesBloc>(
          create: (context) {
            return sld<MoviesBloc>();
          },
          child: const MoviesScreen(),
        ));
  }

  /// This method is responsible for returning the app locale
  /// depending on the device's locale.
  Locale? handlingAppLocaleMethod(deviceLocale, supportedLocales) {
    bool
        isDeviceLocaleSupported = /* it will be true if the device's language is upported by 
        the app. otherwise, it will be false.*/
        supportedLocales.any((supportedLocale) =>
            supportedLocale.languageCode == deviceLocale!.languageCode);

    if (isDeviceLocaleSupported) {
      sld<BaseMovieRemoteDataSource>().language = deviceLocale!
          .languageCode; // Changing the remote data source's language.
      sld<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent());
      return deviceLocale;
    } else {
      sld<BaseMovieRemoteDataSource>().language = 'en';
      sld<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent());
      return const Locale('en');
    }
  }
}
