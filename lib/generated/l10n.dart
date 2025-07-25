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

  /// `ROADSHARE`
  String get ROADSHARE {
    return Intl.message('ROADSHARE', name: 'ROADSHARE', desc: '', args: []);
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
  }

  /// `NEXT`
  String get Next {
    return Intl.message('NEXT', name: 'Next', desc: '', args: []);
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

  /// `Get Started!`
  String get GetStarted {
    return Intl.message('Get Started!', name: 'GetStarted', desc: '', args: []);
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

  /// `Confirm Your Driver`
  String get onboardingtitle2 {
    return Intl.message(
      'Confirm Your Driver',
      name: 'onboardingtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Track your ride`
  String get onboardingtitle3 {
    return Intl.message(
      'Track your ride',
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

  /// `Know your driver in advance and be able to view current location in real time on the map`
  String get onboardingsubtitle3 {
    return Intl.message(
      'Know your driver in advance and be able to view current location in real time on the map',
      name: 'onboardingsubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get Log_in {
    return Intl.message('Log in', name: 'Log_in', desc: '', args: []);
  }

  /// `Log into your account`
  String get Log_into_your_account {
    return Intl.message(
      'Log into your account',
      name: 'Log_into_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Roadshare, enter your details below to continue ordering`
  String get Welcome_to_Roadshare {
    return Intl.message(
      'Welcome to Roadshare, enter your details below to continue ordering',
      name: 'Welcome_to_Roadshare',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Phone`
  String get Enter_Phone {
    return Intl.message(
      'Enter your Phone',
      name: 'Enter_Phone',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message('Continue', name: 'Continue', desc: '', args: []);
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `Don’t have an account? `
  String get DontHaveAnAccount {
    return Intl.message(
      'Don’t have an account? ',
      name: 'DontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Sign_up {
    return Intl.message('Sign up', name: 'Sign_up', desc: '', args: []);
  }

  /// `Create your account`
  String get create_your_account {
    return Intl.message(
      'Create your account',
      name: 'create_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continue_with_google {
    return Intl.message(
      'Continue with Google',
      name: 'continue_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continue_with_apple {
    return Intl.message(
      'Continue with Apple',
      name: 'continue_with_apple',
      desc: '',
      args: [],
    );
  }

  /// `SMS Code`
  String get SMS_Code {
    return Intl.message('SMS Code', name: 'SMS_Code', desc: '', args: []);
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
