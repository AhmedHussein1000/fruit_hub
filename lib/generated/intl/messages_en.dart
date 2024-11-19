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
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "email": MessageLookupByLibrary.simpleMessage("Email Address"),
        "emailRequired":
            MessageLookupByLibrary.simpleMessage("Email is required."),
        "forrgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "invalidCredential": MessageLookupByLibrary.simpleMessage(
            "The email address or password is incorrect."),
        "invalidEmail": MessageLookupByLibrary.simpleMessage(
            "The email address is badly formatted."),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginWithFacebook":
            MessageLookupByLibrary.simpleMessage("Login with Facebook"),
        "loginWithGoogle":
            MessageLookupByLibrary.simpleMessage("Login with Google"),
        "networkRequestFailed": MessageLookupByLibrary.simpleMessage(
            "Check your internet connection."),
        "onboardingDescription1": MessageLookupByLibrary.simpleMessage(
            "Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and high quality."),
        "onboardingDescription2": MessageLookupByLibrary.simpleMessage(
            "We bring you the best carefully selected fruits. View details, images, and reviews to make sure you choose the perfect fruit."),
        "onboardingTitle2":
            MessageLookupByLibrary.simpleMessage("Search and Shop"),
        "operationNotAllowed": MessageLookupByLibrary.simpleMessage(
            "Signing in with email and password is not enabled."),
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordRequired":
            MessageLookupByLibrary.simpleMessage("Password is required."),
        "signup": MessageLookupByLibrary.simpleMessage(" Sign Up"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "startNow": MessageLookupByLibrary.simpleMessage("Start Now"),
        "tooManyRequests": MessageLookupByLibrary.simpleMessage(
            "Too many requests. Try again later."),
        "unexpectedError": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred, please try again."),
        "userDisabled": MessageLookupByLibrary.simpleMessage(
            "This user account has been disabled."),
        "userNotFound": MessageLookupByLibrary.simpleMessage(
            "No user found for that email."),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome to"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage(
            "Wrong password provided for that user.")
      };
}
