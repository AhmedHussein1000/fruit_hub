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

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and quality.`
  String get onboardingDescription1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and quality.',
      name: 'onboardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Search & Shop`
  String get onboardingTitle2 {
    return Intl.message(
      'Search & Shop',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the best hand-picked fruits. Check out details, images, and reviews to make sure you're choosing the perfect fruit.`
  String get onboardingDescription2 {
    return Intl.message(
      'We offer you the best hand-picked fruits. Check out details, images, and reviews to make sure you\'re choosing the perfect fruit.',
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

  /// `Password reset link sent. Please check your email.`
  String get passwordResetEmailSent {
    return Intl.message(
      'Password reset link sent. Please check your email.',
      name: 'passwordResetEmailSent',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we'll send you instructions to reset your password.`
  String get resetPasswordInstructions {
    return Intl.message(
      'Enter your email address and we\'ll send you instructions to reset your password.',
      name: 'resetPasswordInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get sendResetLink {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully.`
  String get passwordChangedSuccessfully {
    return Intl.message(
      'Password changed successfully.',
      name: 'passwordChangedSuccessfully',
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

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
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

  /// `This field is required.`
  String get field_required {
    return Intl.message(
      'This field is required.',
      name: 'field_required',
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

  /// `Changes saved successfully.`
  String get changes_saved_successfully {
    return Intl.message(
      'Changes saved successfully.',
      name: 'changes_saved_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match.`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match.',
      name: 'passwordsDoNotMatch',
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

  /// `No favorites yet!`
  String get no_favorites_yet {
    return Intl.message(
      'No favorites yet!',
      name: 'no_favorites_yet',
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
  String get shoppingCart {
    return Intl.message(
      'Cart',
      name: 'shoppingCart',
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

  /// `Results`
  String get results {
    return Intl.message(
      'Results',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed`
  String get ahmed {
    return Intl.message(
      'Ahmed',
      name: 'ahmed',
      desc: '',
      args: [],
    );
  }

  /// `{resultsCount} results`
  String resultsCount(int resultsCount) {
    return Intl.message(
      '$resultsCount results',
      name: 'resultsCount',
      desc: '',
      args: [resultsCount],
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

  /// `You have {numberOfCartProducts} products in your cart`
  String CartProductsCount(int numberOfCartProducts) {
    return Intl.message(
      'You have $numberOfCartProducts products in your cart',
      name: 'CartProductsCount',
      desc: '',
      args: [numberOfCartProducts],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Added to Cart Successfully`
  String get addedToCart {
    return Intl.message(
      'Added to Cart Successfully',
      name: 'addedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Shipping`
  String get shipping {
    return Intl.message(
      'Shipping',
      name: 'shipping',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Your Cart is Empty`
  String get cartIsEmpty {
    return Intl.message(
      'Your Cart is Empty',
      name: 'cartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Pay with Paypal`
  String get paypalPayment {
    return Intl.message(
      'Pay with Paypal',
      name: 'paypalPayment',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cash_on_delivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cash_on_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Pickup from Location`
  String get pickup_delivery_option {
    return Intl.message(
      'Pickup from Location',
      name: 'pickup_delivery_option',
      desc: '',
      args: [],
    );
  }

  /// `Online Payment`
  String get online_payment {
    return Intl.message(
      'Online Payment',
      name: 'online_payment',
      desc: '',
      args: [],
    );
  }

  /// `Please select a payment method`
  String get payment_method {
    return Intl.message(
      'Please select a payment method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message(
      'Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Floor and Apartment`
  String get floor_and_apartment {
    return Intl.message(
      'Floor and Apartment',
      name: 'floor_and_apartment',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get order_summary {
    return Intl.message(
      'Order Summary',
      name: 'order_summary',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total`
  String get sub_total {
    return Intl.message(
      'Sub Total',
      name: 'sub_total',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get delivery_address {
    return Intl.message(
      'Delivery Address',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Please select a payment method`
  String get select_payment_method {
    return Intl.message(
      'Please select a payment method',
      name: 'select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Payment error, please try again`
  String get payment_error {
    return Intl.message(
      'Payment error, please try again',
      name: 'payment_error',
      desc: '',
      args: [],
    );
  }

  /// `Payment successful`
  String get payment_success {
    return Intl.message(
      'Payment successful',
      name: 'payment_success',
      desc: '',
      args: [],
    );
  }

  /// `Payment cancelled`
  String get payment_cancelled {
    return Intl.message(
      'Payment cancelled',
      name: 'payment_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Failed to add order`
  String get add_order_failure {
    return Intl.message(
      'Failed to add order',
      name: 'add_order_failure',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile`
  String get personal_file {
    return Intl.message(
      'Your Profile',
      name: 'personal_file',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Who are we?`
  String get who_are_we {
    return Intl.message(
      'Who are we?',
      name: 'who_are_we',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Are you want to logout?`
  String get signout_message {
    return Intl.message(
      'Are you want to logout?',
      name: 'signout_message',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `FruitHub is a premium fruit delivery service dedicated to bringing the freshest, highest quality fruits directly to your doorstep. We work with local farmers to ensure you receive the best produce while supporting sustainable agriculture.`
  String get who_are_we_content {
    return Intl.message(
      'FruitHub is a premium fruit delivery service dedicated to bringing the freshest, highest quality fruits directly to your doorstep. We work with local farmers to ensure you receive the best produce while supporting sustainable agriculture.',
      name: 'who_are_we_content',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personal_information {
    return Intl.message(
      'Personal Information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get incorrect_password {
    return Intl.message(
      'Incorrect password',
      name: 'incorrect_password',
      desc: '',
      args: [],
    );
  }

  /// `Failed to search products`
  String get search_products_failure {
    return Intl.message(
      'Failed to search products',
      name: 'search_products_failure',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get no_results_found {
    return Intl.message(
      'No results found',
      name: 'no_results_found',
      desc: '',
      args: [],
    );
  }

  /// `Sort By:`
  String get sortBy {
    return Intl.message(
      'Sort By:',
      name: 'sortBy',
      desc: '',
      args: [],
    );
  }

  /// `Price (Low to High)`
  String get priceLowToHigh {
    return Intl.message(
      'Price (Low to High)',
      name: 'priceLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price (High to Low)`
  String get priceHighToLow {
    return Intl.message(
      'Price (High to Low)',
      name: 'priceHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Alphabetical`
  String get alphabetical {
    return Intl.message(
      'Alphabetical',
      name: 'alphabetical',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Failed to get products`
  String get get_products_failure {
    return Intl.message(
      'Failed to get products',
      name: 'get_products_failure',
      desc: '',
      args: [],
    );
  }

  /// `Expiration`
  String get expiration {
    return Intl.message(
      'Expiration',
      name: 'expiration',
      desc: '',
      args: [],
    );
  }

  /// `Organic`
  String get organic {
    return Intl.message(
      'Organic',
      name: 'organic',
      desc: '',
      args: [],
    );
  }

  /// `{numberOfCalories} calories`
  String number_of_calories(num numberOfCalories) {
    return Intl.message(
      '$numberOfCalories calories',
      name: 'number_of_calories',
      desc: '',
      args: [numberOfCalories],
    );
  }

  /// `{numberOfGrams} grams`
  String number_of_grams(int numberOfGrams) {
    return Intl.message(
      '$numberOfGrams grams',
      name: 'number_of_grams',
      desc: '',
      args: [numberOfGrams],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get add_to_cart {
    return Intl.message(
      'Add to Cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Less than a month`
  String get less_than_a_month {
    return Intl.message(
      'Less than a month',
      name: 'less_than_a_month',
      desc: '',
      args: [],
    );
  }

  /// `{count} months`
  String months_count(int count) {
    return Intl.message(
      '$count months',
      name: 'months_count',
      desc: '',
      args: [count],
    );
  }

  /// `Failed to get orders`
  String get failed_to_get_orders {
    return Intl.message(
      'Failed to get orders',
      name: 'failed_to_get_orders',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `No orders yet`
  String get no_orders_yet {
    return Intl.message(
      'No orders yet',
      name: 'no_orders_yet',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get order_status_pending {
    return Intl.message(
      'Pending',
      name: 'order_status_pending',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get order_status_accepted {
    return Intl.message(
      'Accepted',
      name: 'order_status_accepted',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get order_status_delivered {
    return Intl.message(
      'Delivered',
      name: 'order_status_delivered',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get order_status_cancelled {
    return Intl.message(
      'Cancelled',
      name: 'order_status_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Order #{orderId}`
  String order_id(String orderId) {
    return Intl.message(
      'Order #$orderId',
      name: 'order_id',
      desc: '',
      args: [orderId],
    );
  }

  /// `item`
  String get item {
    return Intl.message(
      'item',
      name: 'item',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get items {
    return Intl.message(
      'items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `{count} {itemText}`
  String order_items_count(int count, String itemText) {
    return Intl.message(
      '$count $itemText',
      name: 'order_items_count',
      desc: '',
      args: [count, itemText],
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
