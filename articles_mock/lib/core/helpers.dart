import 'package:articles_mock/core/error/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String mapFailureToMessage(Failure failure) {
    final currentLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final appLocalizations = lookupAppLocalizations(basicLocaleListResolution(
      [currentLocale],
      AppLocalizations.supportedLocales,
    ));

    switch (failure.runtimeType) {
      case LocalDataServiceFailure:
        return appLocalizations.local_data_failure;

      case AuthenticationFailure:
        final authenticationFailure = failure as AuthenticationFailure;

        switch (authenticationFailure.errorCode) {
          case 'weak-password':
            return appLocalizations.weak_password;

          case 'email-already-in-use':
            return appLocalizations.email_already_in_use;

          case 'user-not-found':
            return appLocalizations.user_not_found;

          case 'wrong-password':
            return appLocalizations.wrong_password;

          case 'invalid-email':
            return appLocalizations.invalid_email;

          default:
            return authenticationFailure.errorCode;
        }

      default:
        return appLocalizations.unknown_exception;
    }
  }
  
void showErrorAlert(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        AppLocalizations.of(context)!.error,
        textAlign: TextAlign.center,
      ),
      content: Text(
        errorMessage,
        textAlign: TextAlign.center,
      ),
    ),
  );
}