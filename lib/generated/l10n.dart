// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
  }

  /// `Next`
  String get Next {
    return Intl.message('Next', name: 'Next', desc: '', args: []);
  }

  /// `Done`
  String get Done {
    return Intl.message('Done', name: 'Done', desc: '', args: []);
  }

  /// `Save`
  String get Save {
    return Intl.message('Save', name: 'Save', desc: '', args: []);
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
  }

  /// `Request Ride`
  String get onboardingtitle1 {
    return Intl.message(
      'Request Ride',
      name: 'onboardingtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Get Picked Up`
  String get onboardingtitle2 {
    return Intl.message(
      'Get Picked Up',
      name: 'onboardingtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Rate Driver`
  String get onboardingtitle3 {
    return Intl.message(
      'Rate Driver',
      name: 'onboardingtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Request a ride get picked up by a nearby community driver`
  String get onboardingsubtitle1 {
    return Intl.message(
      'Request a ride get picked up by a nearby community driver',
      name: 'onboardingsubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Huge drivers network helps you find comforable, safe and cheap ride`
  String get onboardingsubtitle2 {
    return Intl.message(
      'Huge drivers network helps you find comforable, safe and cheap ride',
      name: 'onboardingsubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Rate your driver and leave a review`
  String get onboardingsubtitle3 {
    return Intl.message(
      'Rate your driver and leave a review',
      name: 'onboardingsubtitle3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
