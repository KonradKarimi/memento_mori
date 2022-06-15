// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_description": MessageLookupByLibrary.simpleMessage(
            "This is an App to visualize your life progress. Each \'block\' represents a week of your life. One row translates to one year, which is consisted of 52 blocks. Filled blocks represent weeks that you\'ve already lived. You can edit your birth date and life expectancy. \n\nBe mindful of your life! 😊\n\nMade with Flutter and Dart!\n"),
        "button_about": MessageLookupByLibrary.simpleMessage("About"),
        "button_edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "button_save": MessageLookupByLibrary.simpleMessage("Save"),
        "fieldLabelText_birthDate":
            MessageLookupByLibrary.simpleMessage("Birth date"),
        "helloWorld": MessageLookupByLibrary.simpleMessage("Hello World!"),
        "helpText_birthDate":
            MessageLookupByLibrary.simpleMessage("Select your birth date"),
        "hintText_birthDate":
            MessageLookupByLibrary.simpleMessage("Select your birth date"),
        "textEdit_pref_life_expectancy":
            MessageLookupByLibrary.simpleMessage("Life expectancy: "),
        "textEdit_pref_you_was_born":
            MessageLookupByLibrary.simpleMessage("You was born on: "),
        "text_no_user_data": MessageLookupByLibrary.simpleMessage(
            "No user data available! 🤷🏾‍️"),
        "text_probably_dead": MessageLookupByLibrary.simpleMessage(
            "You are probably dead already! 🤷🏾‍"),
        "text_years": MessageLookupByLibrary.simpleMessage("years")
      };
}
