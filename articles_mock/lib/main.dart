// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:articles_mock/app/app.dart';
import 'package:articles_mock/presentation/blocs/articles/articles_bloc.dart';
import 'package:articles_mock/presentation/blocs/app_bloc_observer.dart';
import 'package:articles_mock/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:articles_mock/core/locator/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

const showDebug = true;

void main() async {
  usePathUrlStrategy(); // turn off the # in the URLs on the web
  Intl.systemLocale = await findSystemLocale();
  initServiceLocator();

  if (showDebug) {
    Bloc.observer = AppBlocObserver();
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              sl<AuthenticationBloc>()..add(AuthenticationStarted()),
        ),
        BlocProvider<ArticlesBloc>(
          create: (context) => sl<ArticlesBloc>(),
        ),
      ],
      child: const App(),
    ),
  );
}
