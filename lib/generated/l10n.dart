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

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get welcome {
    return Intl.message(
      'Welcome to',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and high quality.`
  String get onboardingDescription1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and high quality.',
      name: 'onboardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get onboardingTitle2 {
    return Intl.message(
      'Search and Shop',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `We bring you the best carefully selected fruits. View details, images, and reviews to make sure you choose the perfect fruit.`
  String get onboardingDescription2 {
    return Intl.message(
      'We bring you the best carefully selected fruits. View details, images, and reviews to make sure you choose the perfect fruit.',
      name: 'onboardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message(
      'Start Now',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forrgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forrgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// ` Sign Up`
  String get signup {
    return Intl.message(
      ' Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get loginWithFacebook {
    return Intl.message(
      'Login with Facebook',
      name: 'loginWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Name is required.`
  String get nameRequired {
    return Intl.message(
      'Name is required.',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email is required.`
  String get emailRequired {
    return Intl.message(
      'Email is required.',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is required.`
  String get passwordRequired {
    return Intl.message(
      'Password is required.',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `User has cancelled login with google.`
  String get noGoogleAccountSelected {
    return Intl.message(
      'User has cancelled login with google.',
      name: 'noGoogleAccountSelected',
      desc: '',
      args: [],
    );
  }

  /// `User has cancelled login with facebook.`
  String get noFacebookAccountSelected {
    return Intl.message(
      'User has cancelled login with facebook.',
      name: 'noFacebookAccountSelected',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get newAccount {
    return Intl.message(
      'New Account',
      name: 'newAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to`
  String get termsAgreement {
    return Intl.message(
      'By creating an account, you agree to',
      name: 'termsAgreement',
      desc: '',
      args: [],
    );
  }

  /// `our Terms and Conditions`
  String get ourTermsAndConditions {
    return Intl.message(
      'our Terms and Conditions',
      name: 'ourTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get createAccount {
    return Intl.message(
      'Create New Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please accept our terms and conditions.`
  String get pleaseAcceptTerms {
    return Intl.message(
      'Please accept our terms and conditions.',
      name: 'pleaseAcceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully.`
  String get signupSuccessful {
    return Intl.message(
      'Account created successfully.',
      name: 'signupSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get userNotFound {
    return Intl.message(
      'No user found for that email.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrongPassword {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `The email address is badly formatted.`
  String get invalidEmail {
    return Intl.message(
      'The email address is badly formatted.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `This user account has been disabled.`
  String get userDisabled {
    return Intl.message(
      'This user account has been disabled.',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Signing in with email and password is not enabled.`
  String get operationNotAllowed {
    return Intl.message(
      'Signing in with email and password is not enabled.',
      name: 'operationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Try again later.`
  String get tooManyRequests {
    return Intl.message(
      'Too many requests. Try again later.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `The email address or password is incorrect.`
  String get invalidCredential {
    return Intl.message(
      'The email address or password is incorrect.',
      name: 'invalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection.`
  String get networkRequestFailed {
    return Intl.message(
      'Check your internet connection.',
      name: 'networkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred, please try again.`
  String get unexpectedError {
    return Intl.message(
      'An unexpected error occurred, please try again.',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'The account already exists for that email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning..!`
  String get goodMorning {
    return Intl.message(
      'Good Morning..!',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed Hussein`
  String get ahmedHussein {
    return Intl.message(
      'Ahmed Hussein',
      name: 'ahmedHussein',
      desc: '',
      args: [],
    );
  }

  /// `Search for.......`
  String get searchFor {
    return Intl.message(
      'Search for.......',
      name: 'searchFor',
      desc: '',
      args: [],
    );
  }

  /// `Eid Offers`
  String get eidOffers {
    return Intl.message(
      'Eid Offers',
      name: 'eidOffers',
      desc: '',
      args: [],
    );
  }

  /// `Discount 25%`
  String get discount25 {
    return Intl.message(
      'Discount 25%',
      name: 'discount25',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get shopNow {
    return Intl.message(
      'Shop Now',
      name: 'shopNow',
      desc: '',
      args: [],
    );
  }

  /// `Best Selling`
  String get bestSelling {
    return Intl.message(
      'Best Selling',
      name: 'bestSelling',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Strawberry`
  String get strawberry {
    return Intl.message(
      'Strawberry',
      name: 'strawberry',
      desc: '',
      args: [],
    );
  }

  /// `{numberOfPounds} Pounds`
  String numberOfPounds(num numberOfPounds) {
    return Intl.message(
      '$numberOfPounds Pounds',
      name: 'numberOfPounds',
      desc: '',
      args: [numberOfPounds],
    );
  }

  /// `/`
  String get slash {
    return Intl.message(
      '/',
      name: 'slash',
      desc: '',
      args: [],
    );
  }

  /// `Kg`
  String get killo {
    return Intl.message(
      'Kg',
      name: 'killo',
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
