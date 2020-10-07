import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

import 'english.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
  };

  String get contactUs {
    return _localizedValues[locale.languageCode]['contactUs'];
  }

  String get homeText {
    return _localizedValues[locale.languageCode]['homeText'];
  }

  String get continueText {
    return _localizedValues[locale.languageCode]['continueText'];
  }

  String get checkPhoneNetwork {
    return _localizedValues[locale.languageCode]['checkPhoneNetwork'];
  }

  String get tnc {
    return _localizedValues[locale.languageCode]['tnc'];
  }

  String get knowtnc {
    return _localizedValues[locale.languageCode]['knowtnc'];
  }

  String get shareApp {
    return _localizedValues[locale.languageCode]['shareApp'];
  }

  String get shareFriends {
    return _localizedValues[locale.languageCode]['shareFriends'];
  }

  String get done {
    return _localizedValues[locale.languageCode]['done'];
  }

  String get thanksText {
    return _localizedValues[locale.languageCode]['thanksText'];
  }

  String get support {
    return _localizedValues[locale.languageCode]['support'];
  }

  String get aboutUs {
    return _localizedValues[locale.languageCode]['aboutUs'];
  }

  String get countryText {
    return _localizedValues[locale.languageCode]['countryText'];
  }

  String get firstNameText {
    return _localizedValues[locale.languageCode]['firstNameText'];
  }

  String get lastNameText {
    return _localizedValues[locale.languageCode]['lastNameText'];
  }

  String get submitText {
    return _localizedValues[locale.languageCode]['submitText'];
  }

  String get firstNameHint {
    return _localizedValues[locale.languageCode]['firstNameHint'];
  }

  String get lastNameHint {
    return _localizedValues[locale.languageCode]['lastNameHint'];
  }

  String get orContinue {
    return _localizedValues[locale.languageCode]['orContinue'];
  }

  String get networkError {
    return _localizedValues[locale.languageCode]['networkError'];
  }

  String get invalidName {
    return _localizedValues[locale.languageCode]['invalidName'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
