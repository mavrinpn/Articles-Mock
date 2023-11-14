import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? emailValidator(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.enter_email;
  }
  if (!EmailValidator.validate(value)) {
    return AppLocalizations.of(context)!.enter_valid_email;
  }
  return null;
}

String? passwordValidator(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.enter_password;
  }
  if (value.length < 8) {
    return AppLocalizations.of(context)!.must_contain_8_chars;
  }
  final regexOneDigit = RegExp(r'[0-9]');
  if (!regexOneDigit.hasMatch(value)) {
    return AppLocalizations.of(context)!.must_contain_1_digit;
  }
  final regexOneUpper = RegExp(r'[A-Z]');
  if (!regexOneUpper.hasMatch(value)) {
    return AppLocalizations.of(context)!.must_contain_1_upper;
  }
  final regexOneLower = RegExp(r'[a-z]');
  if (!regexOneLower.hasMatch(value)) {
    return AppLocalizations.of(context)!.must_contain_1_lower;
  }
  return null;
}
