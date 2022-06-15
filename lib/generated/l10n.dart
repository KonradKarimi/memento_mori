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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Select your birth date`
  String get helpText_birthDate {
    return Intl.message(
      'Select your birth date',
      name: 'helpText_birthDate',
      desc: 'The help text for the birth date field',
      args: [],
    );
  }

  /// `Birth date`
  String get fieldLabelText_birthDate {
    return Intl.message(
      'Birth date',
      name: 'fieldLabelText_birthDate',
      desc: 'The field label text for the birth date field',
      args: [],
    );
  }

  /// `You was born on: `
  String get textEdit_pref_you_was_born {
    return Intl.message(
      'You was born on: ',
      name: 'textEdit_pref_you_was_born',
      desc: 'The text to display before the birth date',
      args: [],
    );
  }

  /// `Select your birth date`
  String get hintText_birthDate {
    return Intl.message(
      'Select your birth date',
      name: 'hintText_birthDate',
      desc: 'The hint text for the birth date field',
      args: [],
    );
  }

  /// `Life expectancy: `
  String get textEdit_pref_life_expectancy {
    return Intl.message(
      'Life expectancy: ',
      name: 'textEdit_pref_life_expectancy',
      desc: 'The text to display before the life expectancy',
      args: [],
    );
  }

  /// `years`
  String get text_years {
    return Intl.message(
      'years',
      name: 'text_years',
      desc: 'The text to display after the life expectancy',
      args: [],
    );
  }

  /// `Edit`
  String get button_edit {
    return Intl.message(
      'Edit',
      name: 'button_edit',
      desc: 'The text for the edit button',
      args: [],
    );
  }

  /// `Save`
  String get button_save {
    return Intl.message(
      'Save',
      name: 'button_save',
      desc: 'The text for the save button',
      args: [],
    );
  }

  /// `About`
  String get button_about {
    return Intl.message(
      'About',
      name: 'button_about',
      desc: 'The text for the about button',
      args: [],
    );
  }

  /// `This is an App to visualize your life progress. Each 'block' represents a week of your life. One row translates to one year, which is consisted of 52 blocks. Filled blocks represent weeks that you've already lived. You can edit your birth date and life expectancy. \n\nBe mindful of your life! 😊\n\nMade with Flutter and Dart!\n`
  String get about_description {
    return Intl.message(
      'This is an App to visualize your life progress. Each \'block\' represents a week of your life. One row translates to one year, which is consisted of 52 blocks. Filled blocks represent weeks that you\'ve already lived. You can edit your birth date and life expectancy. \n\nBe mindful of your life! 😊\n\nMade with Flutter and Dart!\n',
      name: 'about_description',
      desc: 'The description for the about dialog',
      args: [],
    );
  }

  /// `You are probably dead already! 🤷🏾‍`
  String get text_probably_dead {
    return Intl.message(
      'You are probably dead already! 🤷🏾‍',
      name: 'text_probably_dead',
      desc: 'The text to display when you are probably dead already',
      args: [],
    );
  }

  /// `No user data available! 🤷🏾‍️`
  String get text_no_user_data {
    return Intl.message(
      'No user data available! 🤷🏾‍️',
      name: 'text_no_user_data',
      desc: 'The text to display when no user data is available',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
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
