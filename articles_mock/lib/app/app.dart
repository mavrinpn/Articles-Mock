import 'package:articles_mock/app/go_router.dart';
import 'package:articles_mock/app/settings.dart';
import 'package:articles_mock/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:articles_mock/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final Settings appSettings;

  const App({required this.appSettings, super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = context.read<AuthenticationBloc>();

    return ListenableProvider.value(
      value: appSettings,
      child: Builder(
        builder: (context) {
          final appSettings = Provider.of<Settings>(context);
          return MaterialApp.router(
            title: 'Articles',
            routerConfig: goRouter(authenticationBloc),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('ru'),
            ],
            theme: AppTheme.getThemeFor(ThemeMode.light),
            darkTheme: AppTheme.getThemeFor(ThemeMode.dark),
            themeMode: appSettings.getThemeMode,
          );
        },
      ),
    );
  }
}
