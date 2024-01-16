import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotstar/data/model/user/user_accounts_model.dart';
import 'package:hotstar/presentation/screen/category_screen.dart';
import 'package:hotstar/presentation/screen/downloads_screen.dart';
import 'package:hotstar/presentation/screen/entry_screen.dart';
import 'package:hotstar/presentation/screen/home_screen.dart';
import 'package:hotstar/presentation/screen/movie_play.dart';
import 'package:hotstar/presentation/screen/series_play.dart';
import 'package:hotstar/presentation/screen/studio_screen.dart';

class AppRouterConfig {
  static final GoRouter router = GoRouter(
    initialLocation: '/entryPage',
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      GoRoute(
        path: '/entryPage',
        name: EntryScreen.entry,
        builder: (context, state) => const EntryScreen(),
      ),
      GoRoute(
        path: '/home',
        name: HomeScreen.home,
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;
          final selectUser = extraData['user'] as String;
          final avatarImg = extraData['accountImg'] ?? '';
          final mood = extraData['mood'] as UserMood;
          return HomeScreen(
            selectedUser: selectUser,
            avatarImg: avatarImg,
            selectedMood: mood,
          );
        },
      ),
      GoRoute(
        path: '/categoryPage',
        name: CategoryScreen.category,
        builder: (context, state) => const CategoryScreen(),
      ),
      GoRoute(
        path: '/downloadPage',
        name: DownloadScreen.download,
        builder: (context, state) => const DownloadScreen(),
      ),
      GoRoute(
        path: '/studioPage',
        name: StudioScreen.studioPage,
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;
          final studioLabel = extraData['studioName'] as String;
          return StudioScreen(studioName: studioLabel);
        },
      ),
      GoRoute(
        path: '/moviePage',
        name: MoviePlay.movieContent,
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;
          final movieName = extraData['movieName'] as String;

          return MoviePlay(movieName: movieName);
        },
      ),
      GoRoute(
        path: '/seriesPage',
        name: SeriesPlay.seriesPlay,
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;
          final serieName = extraData['tvName'] as String;
          return SeriesPlay(seriesName: serieName);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Container(
        color: Colors.green.shade200,
        alignment: Alignment.center,
        child: Text('${state.error}'),
      ),
    ),
  );
}
