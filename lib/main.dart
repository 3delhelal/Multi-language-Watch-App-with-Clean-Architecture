import '/Core/services/services_locator.dart';
import '/Core/theme/temporary_theme.dart';
import '/Moves/presentation/screens/movie/movies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider<MoviesBloc>(
        create: (context) {
          return sld<MoviesBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent());
        },
        child: MaterialApp(
          title: 'Watch App',
          debugShowCheckedModeBanner: false,
          theme: tempTheme(),
          home: const MoviesScreen(),
        ));
  }
}
