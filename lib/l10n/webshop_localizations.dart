import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webshop/l10n/en.dart';
import 'package:webshop/l10n/hu.dart';

class WebshopLocalizations {
  final Locale locale;

  WebshopLocalizations(this.locale);

  static WebshopLocalizations of(BuildContext context) {
    return Localizations.of<WebshopLocalizations>(
        context, WebshopLocalizations);
  }

  static const LocalizationsDelegate<WebshopLocalizations> delegate =
  _WebshopLocalizationsDelegate();

  static Map<String, Map<String, String>> _localizedValues = {
    'en': ENGLISH_TEXTS,
    'hu': HUNGARIAN_TEXTS,
  };

  String stringById(String id) => _localizedValues[locale.languageCode][id];

  String get addAddressDialogTitle => stringById('addAddressDialogTitle');
  String get addresses => stringById('addresses');
  String get addressSaved => stringById('addressSaved');
  String get addToCart => stringById('addToCart');
  String get black => stringById('black');
  String get cancel => stringById('cancel');
  String get canNotAccessToContacts => stringById('canNotAccessToContacts');
  String get cart => stringById('cart');
  String get chooseContact => stringById('chooseContact');
  String get city => stringById('city');
  String get color => stringById('color');
  String get details => stringById('details');
  String get email => stringById('email');
  String get enterYourEmail => stringById('enterYourEmail');
  String get enterYourName => stringById('enterYourName');
  String get enterYourPhone => stringById('enterYourPhone');
  String get grey => stringById('grey');
  String get houseNumber => stringById('houseNumber');
  String get large => stringById('large');
  String get mandatoryField => stringById('mandatoryField');
  String get medium => stringById('medium');
  String get mobilePhones => stringById('mobilePhones');
  String get name => stringById('name');
  String get phone => stringById('phone');
  String get profile => stringById('profile');
  String get profileSaved => stringById('profileSaved');
  String get save => stringById('save');
  String get size => stringById('size');
  String get small => stringById('small');
  String get street => stringById('street');
  String get takeAPicture => stringById('takeAPicture');
  String get total => stringById('total');
  String get unknown => stringById('unknown');
  String get whoWillUse => stringById('whoWillUse');
  String get white => stringById('white');
}

class _WebshopLocalizationsDelegate
    extends LocalizationsDelegate<WebshopLocalizations> {
  const _WebshopLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hu'].contains(locale.languageCode);

  @override
  Future<WebshopLocalizations> load(Locale locale) {
    return SynchronousFuture<WebshopLocalizations>(
      WebshopLocalizations(locale),
    );
  }

  @override
  bool shouldReload(_WebshopLocalizationsDelegate old) => false;
}
