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

  /// `Home`
  String get home_navigation_bar {
    return Intl.message(
      'Home',
      name: 'home_navigation_bar',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products_navigation_bar {
    return Intl.message(
      'Products',
      name: 'products_navigation_bar',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart_navigation_bar {
    return Intl.message(
      'Cart',
      name: 'cart_navigation_bar',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_navigation_bar {
    return Intl.message(
      'Profile',
      name: 'profile_navigation_bar',
      desc: '',
      args: [],
    );
  }

  /// `AI Assistant`
  String get ai_assistant_navigation_bar {
    return Intl.message(
      'AI Assistant',
      name: 'ai_assistant_navigation_bar',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get add_to_cart_button {
    return Intl.message(
      'Add to Cart',
      name: 'add_to_cart_button',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get shop_now_button {
    return Intl.message(
      'Shop Now',
      name: 'shop_now_button',
      desc: '',
      args: [],
    );
  }

  /// `Kilogram`
  String get kilogram {
    return Intl.message('Kilogram', name: 'kilogram', desc: '', args: []);
  }

  /// `Dollar`
  String get dollar {
    return Intl.message('Dollar', name: 'dollar', desc: '', args: []);
  }

  /// `Months`
  String get months {
    return Intl.message('Months', name: 'months', desc: '', args: []);
  }

  /// `Review`
  String get review_button {
    return Intl.message('Review', name: 'review_button', desc: '', args: []);
  }

  /// `Organic`
  String get organic {
    return Intl.message('Organic', name: 'organic', desc: '', args: []);
  }

  /// `Expiration`
  String get expiration {
    return Intl.message('Expiration', name: 'expiration', desc: '', args: []);
  }

  /// `Sellings`
  String get sellings {
    return Intl.message('Sellings', name: 'sellings', desc: '', args: []);
  }

  /// `Calory`
  String get calory {
    return Intl.message('Calory', name: 'calory', desc: '', args: []);
  }

  /// `Good morning! ..`
  String get home_welcome_message {
    return Intl.message(
      'Good morning! ..',
      name: 'home_welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Search ...`
  String get home_search_hint {
    return Intl.message(
      'Search ...',
      name: 'home_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Most Selling`
  String get home_most_selling {
    return Intl.message(
      'Most Selling',
      name: 'home_most_selling',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get home_more_button {
    return Intl.message('More', name: 'home_more_button', desc: '', args: []);
  }

  /// `Products`
  String get products_title {
    return Intl.message('Products', name: 'products_title', desc: '', args: []);
  }

  /// `Results`
  String get products_results {
    return Intl.message(
      'Results',
      name: 'products_results',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart_title {
    return Intl.message('Cart', name: 'cart_title', desc: '', args: []);
  }

  /// `Pay {price} dollars`
  String cart_pay_button(Object price) {
    return Intl.message(
      'Pay $price dollars',
      name: 'cart_pay_button',
      desc: '',
      args: [price],
    );
  }

  /// `you have {count} products in shopping cart`
  String cart_products_count(Object count) {
    return Intl.message(
      'you have $count products in shopping cart',
      name: 'cart_products_count',
      desc: '',
      args: [count],
    );
  }

  /// `Intelligent Assistant`
  String get ai_chat_title {
    return Intl.message(
      'Intelligent Assistant',
      name: 'ai_chat_title',
      desc: '',
      args: [],
    );
  }

  /// `Write your message here ...`
  String get ai_chat_hint {
    return Intl.message(
      'Write your message here ...',
      name: 'ai_chat_hint',
      desc: '',
      args: [],
    );
  }

  /// `Sort By :`
  String get filter_sort_by {
    return Intl.message(
      'Sort By :',
      name: 'filter_sort_by',
      desc: '',
      args: [],
    );
  }

  /// `Alphabet`
  String get filter_alphabet {
    return Intl.message(
      'Alphabet',
      name: 'filter_alphabet',
      desc: '',
      args: [],
    );
  }

  /// `Price (Ascending)`
  String get filter_price_ascending {
    return Intl.message(
      'Price (Ascending)',
      name: 'filter_price_ascending',
      desc: '',
      args: [],
    );
  }

  /// `Price (Descending)`
  String get filter_price_descending {
    return Intl.message(
      'Price (Descending)',
      name: 'filter_price_descending',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter_button {
    return Intl.message('Filter', name: 'filter_button', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout_title {
    return Intl.message('Checkout', name: 'checkout_title', desc: '', args: []);
  }

  /// `Shipping`
  String get checkout_shipping_method {
    return Intl.message(
      'Shipping',
      name: 'checkout_shipping_method',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get checkout_address {
    return Intl.message(
      'Address',
      name: 'checkout_address',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get checkout_payment {
    return Intl.message(
      'Payment',
      name: 'checkout_payment',
      desc: '',
      args: [],
    );
  }

  /// ` Payment with Cash`
  String get checkout_shipping_with_cash {
    return Intl.message(
      ' Payment with Cash',
      name: 'checkout_shipping_with_cash',
      desc: '',
      args: [],
    );
  }

  /// `Payment Online`
  String get checkout_shipping_online {
    return Intl.message(
      'Payment Online',
      name: 'checkout_shipping_online',
      desc: '',
      args: [],
    );
  }

  /// `Delivery from the location \n with delivery cost: 2 `
  String get checkout_shipping_with_cash_subtitle {
    return Intl.message(
      'Delivery from the location \n with delivery cost: 2 ',
      name: 'checkout_shipping_with_cash_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Please select the payment method`
  String get checkout_shipping_online_subtitle {
    return Intl.message(
      'Please select the payment method',
      name: 'checkout_shipping_online_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get checkout_address_field_name {
    return Intl.message(
      'Full Name',
      name: 'checkout_address_field_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get checkout_address_field_email {
    return Intl.message(
      'Email',
      name: 'checkout_address_field_email',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get checkout_address_field_city {
    return Intl.message(
      'City',
      name: 'checkout_address_field_city',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get checkout_address_field_address {
    return Intl.message(
      'Address',
      name: 'checkout_address_field_address',
      desc: '',
      args: [],
    );
  }

  /// `Street Name,Postal Code , Building Number ..`
  String get checkout_address_field_address_details {
    return Intl.message(
      'Street Name,Postal Code , Building Number ..',
      name: 'checkout_address_field_address_details',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get checkout_address_field_phone {
    return Intl.message(
      'Phone',
      name: 'checkout_address_field_phone',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary :`
  String get checkout_payment_summary {
    return Intl.message(
      'Order Summary :',
      name: 'checkout_payment_summary',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address :`
  String get checkout_payment_address {
    return Intl.message(
      'Delivery Address :',
      name: 'checkout_payment_address',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get checkout_payment_total {
    return Intl.message(
      'Total',
      name: 'checkout_payment_total',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount :`
  String get checkout_payment_total_subtitle {
    return Intl.message(
      'Total Amount :',
      name: 'checkout_payment_total_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Delivery :`
  String get checkout_payment_delivery_cost {
    return Intl.message(
      'Delivery :',
      name: 'checkout_payment_delivery_cost',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get checkout_payment_edit_button {
    return Intl.message(
      'Edit',
      name: 'checkout_payment_edit_button',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get checkout_button_next {
    return Intl.message(
      'Next',
      name: 'checkout_button_next',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Address`
  String get checkout_button_address {
    return Intl.message(
      'Confirm Address',
      name: 'checkout_button_address',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get checkout_button_order {
    return Intl.message(
      'Confirm Order',
      name: 'checkout_button_order',
      desc: '',
      args: [],
    );
  }

  /// `Payment with Paypal`
  String get checkout_button_payment_with_paypal {
    return Intl.message(
      'Payment with Paypal',
      name: 'checkout_button_payment_with_paypal',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_title {
    return Intl.message('Profile', name: 'profile_title', desc: '', args: []);
  }

  /// `General`
  String get profile_header_section {
    return Intl.message(
      'General',
      name: 'profile_header_section',
      desc: '',
      args: [],
    );
  }

  /// `Personal File`
  String get profile_personal_file {
    return Intl.message(
      'Personal File',
      name: 'profile_personal_file',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get profile_my_orders {
    return Intl.message(
      'My Orders',
      name: 'profile_my_orders',
      desc: '',
      args: [],
    );
  }

  /// `My Payments`
  String get profile_my_payments {
    return Intl.message(
      'My Payments',
      name: 'profile_my_payments',
      desc: '',
      args: [],
    );
  }

  /// `My Favorites`
  String get profile_my_favorites {
    return Intl.message(
      'My Favorites',
      name: 'profile_my_favorites',
      desc: '',
      args: [],
    );
  }

  /// `My Notifications`
  String get profile_my_notifications {
    return Intl.message(
      'My Notifications',
      name: 'profile_my_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get profile_language {
    return Intl.message(
      'Language',
      name: 'profile_language',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get profile_select_language {
    return Intl.message(
      'Select Language',
      name: 'profile_select_language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get profile_theme {
    return Intl.message('Theme', name: 'profile_theme', desc: '', args: []);
  }

  /// `About Us`
  String get profile_about_us {
    return Intl.message(
      'About Us',
      name: 'profile_about_us',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get profile_help {
    return Intl.message('Help', name: 'profile_help', desc: '', args: []);
  }

  /// `Log Out`
  String get profile_log_out_button {
    return Intl.message(
      'Log Out',
      name: 'profile_log_out_button',
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
