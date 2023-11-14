import 'dart:async';

import 'package:articles_mock/business/entities/article_entity.dart';
import 'package:articles_mock/main.dart';
import 'package:articles_mock/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:articles_mock/presentation/pages/articles/article_detail_screen.dart';
import 'package:articles_mock/presentation/pages/articles/articles_screen.dart';
import 'package:articles_mock/presentation/pages/splash_screen.dart';
import 'package:articles_mock/presentation/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _mainNavigatorKey = GlobalKey<NavigatorState>();

GoRouter goRouter(AuthenticationBloc authenticationBloc) {
  return GoRouter(
    initialLocation: '/splash',
    navigatorKey: _mainNavigatorKey,
    debugLogDiagnostics: showDebug,
    redirect: ((context, state) {
      final currentLocation = state.fullPath;

      if (currentLocation != '/welcome' &&
          authenticationBloc.state is AuthenticationNone) {
        return '/welcome';
      }
      if (currentLocation != '/welcome' &&
          authenticationBloc.state is AuthenticationError) {
        return '/welcome';
      }
      if (currentLocation == '/welcome' &&
          authenticationBloc.state is AuthenticationSuccess) {
        return '/articles_list';
      }
      if (currentLocation == '/splash' &&
          authenticationBloc.state is AuthenticationSuccess) {
        return '/articles_list';
      }
      return null;
    }),
    refreshListenable: GoRouterRefreshStream(authenticationBloc.stream),
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/welcome',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const WelcomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: '/articles_list',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const ArticlesScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
        routes: [
          GoRoute(
            path: 'article_detail',
            builder: (context, state) {
              final article = state.extra as ArticleEntity;
              return ArticleDetailScreen(article: article);
            },
          ),
        ],
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
