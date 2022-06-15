// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pl';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_description": MessageLookupByLibrary.simpleMessage(
            "Aplikacja wyświetla wykres Twojego życia. Każda „kratka” reprezentuje tydzień Twojego życia. Jeden rząd to rok życia, czyli 52 tygodnie. Wypełnione kratki oznaczają tygodnie, które już przeżyłeś. Możesz edytować swoją datę urodzenia i przewidywaną długość życia. \n\nCiesz się życiem! 😊\n\nWykonane z wykorzystaniem Fluttera i Darta!\n"),
        "button_about": MessageLookupByLibrary.simpleMessage("O aplikacji"),
        "button_edit": MessageLookupByLibrary.simpleMessage("Edytuj"),
        "button_save": MessageLookupByLibrary.simpleMessage("Zapisz"),
        "fieldLabelText_birthDate":
            MessageLookupByLibrary.simpleMessage("Data urodzenia"),
        "helloWorld": MessageLookupByLibrary.simpleMessage("Witaj świecie!"),
        "helpText_birthDate":
            MessageLookupByLibrary.simpleMessage("Podaj swoję datę urodzenia"),
        "hintText_birthDate":
            MessageLookupByLibrary.simpleMessage("Podaj swoję datę urodzenia"),
        "textEdit_pref_life_expectancy":
            MessageLookupByLibrary.simpleMessage("Planowana długość życia:"),
        "textEdit_pref_you_was_born":
            MessageLookupByLibrary.simpleMessage("Urodziłeś się:"),
        "text_no_user_data": MessageLookupByLibrary.simpleMessage(
            "Nie znaleziono danych użytkownika 🤷🏾‍️"),
        "text_probably_dead": MessageLookupByLibrary.simpleMessage(
            "Prawdopodobnie już nie żyjesz! 🤷🏾‍"),
        "text_years": MessageLookupByLibrary.simpleMessage("lat")
      };
}
