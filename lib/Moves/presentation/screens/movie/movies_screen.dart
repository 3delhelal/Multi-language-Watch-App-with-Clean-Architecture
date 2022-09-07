import '/Moves/presentation/screens/movie/components/now_playing_widget_component.dart';
import '/Moves/presentation/screens/movie/components/popular_widget_components.dart';
import '/Moves/presentation/screens/movie/components/top_rated_widget_component.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: const Key('homeScreenScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingWidgetComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  InkWell(
                    hoverColor: Colors.white10,
                    onTap: () {
                      // TODO : NAVIGATE TO A Screen
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('See More',
                              style: Theme.of(context).textTheme.headlineSmall),
                          const Icon(
                            Icons.arrow_forward_ios,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const PopularWidgetComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Rated",
                      style: Theme.of(context).textTheme.headlineMedium),
                  InkWell(
                    hoverColor: Colors.white10,
                    onTap: () {
                      // TODO : NAVIGATE TO A Screen
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('See More',
                              style: Theme.of(context).textTheme.headlineSmall),
                          const Icon(
                            Icons.arrow_forward_ios,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TopRatedWidgetComponent(),
          ],
        ),
      ),
    );
  }
}
