import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Set_Limit
  {
    'txgk33np': {
      'en': 'Set Limit',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lxvp477b': {
      'en': 'Dylan',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mhk1k8bk': {
      'en': 'Enter Amount (RM)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ffm9qaxn': {
      'en': 'Entertainment',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7u55t6zb': {
      'en': 'Food',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nmd8amq0': {
      'en': 'Academics',
      'ar': '',
      'de': '',
      'es': '',
    },
    'spz4m1s1': {
      'en': 'Clothings',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qn0br7d8': {
      'en': 'Others',
      'ar': '',
      'de': '',
      'es': '',
    },
    'r0rlh532': {
      'en': 'Select Category',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p20z7ipd': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ss8exe1i': {
      'en': 'Submit',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cs1cy7tg': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // Home
  {
    'xn2so8km': {
      'en': 'Dylan Tan',
      'ar': 'بطاقتي',
      'de': 'Meine Karte',
      'es': 'Mi tarjeta',
    },
    'vld1p5z2': {
      'en': 'Parents',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6t7n9ugd': {
      'en': 'TAN ZE HAN DYLAN',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    '5m2cq8dw': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'h3086ma4': {
      'en': 'RM 275.00',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'lr97k2rc': {
      'en': '**** **** **** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'l9racj60': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    '0c3ulups': {
      'en': 'Reload',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yet7zk5d': {
      'en': 'Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    '8bnd6lco': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    '7curto4s': {
      'en': 'Transfer pocket money to your children',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wh3917wy': {
      'en': 'Add Child',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'wz4zzxld': {
      'en': 'Add child by scanning the QR code',
      'ar': '',
      'de': '',
      'es': '',
    },
    '27pb7ji4': {
      'en': 'Transaction',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'nd57lnti': {
      'en': 'Reload Payment',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xs4cn7uk': {
      'en': 'Via Visa Card',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'hfynfrek': {
      'en': '+RM 100',
      'ar': '',
      'de': '',
      'es': '',
    },
    'evhprbi0': {
      'en': '8 Sep, 19:13',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4ck21zar': {
      'en': 'Transfer to Sarween',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tc5qrfn3': {
      'en': 'Via E-wallet',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'rt1e4f42': {
      'en': '-RM 100',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1ztz6m6p': {
      'en': '8 Sep, 19:10',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vd80n9xc': {
      'en': 'Reload Payment',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tmw6psq3': {
      'en': 'Via Visa Card',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'v5xar4rb': {
      'en': '+RM 70',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zsq118zo': {
      'en': '7 Sep, 19:13',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hisa8hmz': {
      'en': 'Reload Payment',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cg8yaz01': {
      'en': 'Via Visa Card',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '10wqr08e': {
      'en': '+RM 100',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fpeoon2n': {
      'en': '6 Sep, 19:13',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm8rhanhc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // Challenge_Main
  {
    'cd0zp71n': {
      'en': 'Challenges',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'p6wpvla2': {
      'en': '279',
      'ar': '',
      'de': '',
      'es': '',
    },
    '961gobtz': {
      'en': 'Set Challenge',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2bt3qnb2': {
      'en': 'Current Challenge',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9ndq06xv': {
      'en': 'Budget Listing',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z3fgcimv': {
      'en': 'Easy',
      'ar': '',
      'de': '',
      'es': '',
    },
    'eclhbqwe': {
      'en': 'List down the price of items and foods that you bought in a week ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z5cprzec': {
      'en': '3 days 23 hours left',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tmq7zub7': {
      'en': '15',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sfbhqp4q': {
      'en': 'Done',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hgxqqolj': {
      'en': 'Money Allocation',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oykxly8o': {
      'en': 'Medium',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aiuhuvjt': {
      'en':
          'You have to allocate the money given by parents wisely and show the report to your parents',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jh50qkv3': {
      'en': '5 days 15 hours left',
      'ar': '',
      'de': '',
      'es': '',
    },
    'el6tt7ma': {
      'en': '25',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i812ucro': {
      'en': 'Done',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ofz2zvlc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // Financial_Graph
  {
    'hxfjifoi': {
      'en': 'September 2023',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ctplmjhe': {
      'en': 'Categories',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8bqcd1g5': {
      'en': 'RM 200',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oy4675iw': {
      'en': 'RM 150',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5mmhd3z2': {
      'en': 'RM 100',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v5v55rr1': {
      'en': 'RM 120',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5u0up5ll': {
      'en': 'Total Expenditure',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l53kroui': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // Financial_Tracker
  {
    'fxmad7x2': {
      'en': 'Fincare',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'ayh8j5yk': {
      'en': 'Tofu',
      'ar': '',
      'de': '',
      'es': '',
    },
    'byow1t0a': {
      'en': 'April Spendings',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tbp35qbv': {
      'en': 'RM 300.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7lo8dv3z': {
      'en': 'Set Limit',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vz2ehe5s': {
      'en': 'Categories',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bge15i5j': {
      'en': 'View Expenses',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dee5mt7c': {
      'en': 'Transaction',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0cgeiwrc': {
      'en': 'Today',
      'ar': '',
      'de': '',
      'es': '',
    },
    'utfddsoo': {
      'en': '- RM 30',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6vms3ryg': {
      'en': 'TGV  (Entertainment)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wzpfyfn9': {
      'en': '+ RM 20',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qkf2nlrn': {
      'en': 'Task 1 (Challenge)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vh1ssrhy': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // Challenge_Set
  {
    '40ksju02': {
      'en': 'Create Challenge',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hkwg4o0d': {
      'en': 'Please enter the information below to add a challenge.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jhd6mh6i': {
      'en': 'Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w8a8g2g1': {
      'en': 'Description here...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ck376o1f': {
      'en': 'No. Of Stars',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec32l1t7': {
      'en': 'Difficulty',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ztgw0zw1': {
      'en': 'Easy',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qa46evft': {
      'en': 'Medium',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5dgtmo9z': {
      'en': 'Hard',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dkkgqjy1': {
      'en': 'Time Allocation (days)',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4v17gwt8': {
      'en': 'Assign',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ycvud35d': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xre66ao': {
      'en': 'Please enter a real name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g5pwhf8k': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cnu93910': {
      'en': 'Please enter a short desription',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wwj6lr6n': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vgzgcbiy': {
      'en': 'We have to have a URL for the project.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3zrqo6lk': {
      'en': 'Please enter a valid URL...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rvdydjps': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hrqgu9b7': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v365mebo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x51ugdbn': {
      'en': 'View Available Challenges',
      'ar': '',
      'de': '',
      'es': '',
    },
    '72eft96x': {
      'en': 'Set Challenge',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    '8myop50b': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // Challenge_Complete
  {
    '0v2hxk67': {
      'en': 'Budget Listing',
      'ar': '',
      'de': '',
      'es': '',
    },
    '96msl08s': {
      'en': 'Easy',
      'ar': '',
      'de': '',
      'es': '',
    },
    'az3d938l': {
      'en': 'Challenge Completed ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ulbtke5x': {
      'en': '15',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ybvoxb4z': {
      'en': 'OK',
      'ar': '',
      'de': '',
      'es': '',
    },
    'my2w7t25': {
      'en': 'Congratulations',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'sjbcbwc4': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // articlepage
  {
    '9m4c5qbl': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ldvv50al': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8b3i8sxh': {
      'en': 'Article',
      'ar': '',
      'de': '',
      'es': '',
    },
    'af0nr44l': {
      'en': 'Media',
      'ar': '',
      'de': '',
      'es': '',
    },
    '21w4a1kv': {
      'en': 'Learn to Plan your Budget',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7z8f1ek7': {
      'en': 'Jackson Hewiit',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x7qjatal': {
      'en': '24',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f9qxmzfo': {
      'en': '1h',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5lodyj6a': {
      'en': 'Read Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'csr9gxew': {
      'en': 'Basic of Cashflow',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7u8oa0fm': {
      'en': 'Andy Brown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jwcg8we4': {
      'en': '13',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8qiglyxq': {
      'en': '4h',
      'ar': '',
      'de': '',
      'es': '',
    },
    's6oypskn': {
      'en': 'Read Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'prvctrxq': {
      'en': 'Mastering Personal Finance',
      'ar': '',
      'de': '',
      'es': '',
    },
    '72tq7e87': {
      'en': 'Greg Donald',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oap39sz9': {
      'en': '22',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vvprzyhe': {
      'en': '7h',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8eg98z3k': {
      'en': 'Read Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    '19gpf09p': {
      'en': 'Sustainable Investing',
      'ar': '',
      'de': '',
      'es': '',
    },
    '03hdn3sx': {
      'en': 'Joseph Style',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dlpe3wzi': {
      'en': '35',
      'ar': '',
      'de': '',
      'es': '',
    },
    '48v6u1ao': {
      'en': '18h',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ab3aek7x': {
      'en': 'Read Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jpo696ow': {
      'en': 'Financial Responsibility Starts at Home',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zekvpw37': {
      'en': 'Barry Jame',
      'ar': '',
      'de': '',
      'es': '',
    },
    '346oeohn': {
      'en': '46',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6uamvdyp': {
      'en': '1d',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5agqvkjw': {
      'en': 'Read Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vztogf1h': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // articlepageMedia
  {
    'cwkzyaf8': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dhs3dn4e': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3f7ltg65': {
      'en': 'Article',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zf4bzu63': {
      'en': 'Media',
      'ar': '',
      'de': '',
      'es': '',
    },
    'to9bcmwb': {
      'en': 'Basics of Cashflow',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q08mrlqf': {
      'en': 'Like',
      'ar': '',
      'de': '',
      'es': '',
    },
    'te1ruy3z': {
      'en': 'Share',
      'ar': '',
      'de': '',
      'es': '',
    },
    'id85tu0x': {
      'en': 'Grow your Finance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uubh3miq': {
      'en': 'Like',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gqb3ryar': {
      'en': 'Share',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mx5q1dca': {
      'en': 'Investing For Beginner',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vwwb898w': {
      'en': 'Like',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p8usdpne': {
      'en': 'Share',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ammb6y6f': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Reload
  {
    'meiw2rfw': {
      'en': 'Reload',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5652ztga': {
      'en': 'Total Amount',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1dyk174s': {
      'en': 'RM30.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x1b9troh': {
      'en': 'Allowance Allocated',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cs0hhpjf': {
      'en': 'Available Balance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iuhde2pd': {
      'en': 'RM20.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0byok20x': {
      'en': 'RM10.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4woheze5': {
      'en': 'Enter Amount',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mc0jq7u4': {
      'en': 'RM',
      'ar': '',
      'de': '',
      'es': '',
    },
    'erqo9bq9': {
      'en': 'RM 10 ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qunwmm6p': {
      'en': 'RM 20 ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lwc6e4b3': {
      'en': 'RM 50 ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pj8tignf': {
      'en': 'RM 100',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mfmj09lh': {
      'en': 'RM 200',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tw1gytna': {
      'en': 'Others',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4xvp6nhi': {
      'en': 'Reload e-wallet',
      'ar': '',
      'de': '',
      'es': '',
    },
    '71i1hco0': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Family_Verification
  {
    'art4e4p2': {
      'en': 'Reload',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cuu60w14': {
      'en': 'Verify\nyour transaction',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uazjnylc': {
      'en': 'We have sent 6-digit code to \n+6017******8',
      'ar': '',
      'de': '',
      'es': '',
    },
    'knstdibw': {
      'en': 'The OTP will expire after 2 minutes',
      'ar': '',
      'de': '',
      'es': '',
    },
    'icqyybsi': {
      'en': 'Verify',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vyuhwuky': {
      'en': 'Resend the code again',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u4mawcgw': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Reload_Complete
  {
    'cr4ldfov': {
      'en': 'Reload Success!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'abosc82b': {
      'en': 'Your top up has beeen successfully done',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mttcozq9': {
      'en': 'Total top up',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0ftlmt4e': {
      'en': 'RM 100.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7azqvph1': {
      'en': 'Done',
      'ar': '',
      'de': '',
      'es': '',
    },
    'esgv47pr': {
      'en': 'Back to Home Page',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y8twcspr': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // articlepageDetail
  {
    'cd7nnr1d': {
      'en': 'Learn to Plan your Budget',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    '7k4mwuue': {
      'en': 'by Jackson Hewiit',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rd8sotbb': {
      'en':
          'Budgeting is a cornerstone of financial responsibility, offering you the roadmap to manage your finances efficiently. It begins with a comprehensive assessment of your financial situation, where you gather all your income sources, expenses, bills, and financial records. This holistic view enables you to set clear and realistic financial goals, which could range from paying off debts to saving for a dream vacation or building an emergency fund. These goals give purpose and direction to your budgeting efforts.\n\nWith your financial objectives in place, the next step is to create a budget. Start by cataloging all your monthly expenses, distinguishing between fixed costs like rent, utilities, and loan payments, and variable expenses such as groceries, dining out, and entertainment. It\'s imperative to differentiate between needs and wants, prioritizing the former in your budget.\n\nTo stay on course with your budget, diligent tracking of your expenses is vital. Many people find it useful to use budgeting apps or tools to monitor their spending habits closely. Additionally, working towards the establishment of an emergency fund is essential, as it acts as a financial safety net for unexpected situations, offering peace of mind and financial stability.\n\nDiscipline plays a pivotal role in budgeting success. Avoiding impulsive purchases and making informed spending decisions are crucial aspects of adhering to your budget. Periodically reviewing and adjusting your budget is equally important, especially as your financial situation evolves over time. As you practice and commit to budgeting, you\'ll find it to be a powerful tool that not only ensures financial stability but also helps you achieve your financial aspirations.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qd31pto0': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // congratulations
  {
    'wsr8vpl4': {
      'en': 'Congratulations!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4de4sn03': {
      'en': 'Tofu has been added\ninto your family circle',
      'ar': '',
      'de': '',
      'es': '',
    },
    'etp2me1j': {
      'en': 'Done',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kt3qphl0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // Personal_Card
  {
    'eod8g205': {
      'en': 'You have registered',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q1z2m8cm': {
      'en': 'Tofu',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yfachyj9': {
      'en': 'I agree with the Terms and Conditions',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7n40oh1r': {
      'en': 'Confirm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xoz7cqg3': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // QR_Scan
  {
    'uje4aome': {
      'en': 'Verify Child Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pkgmn37x': {
      'en': 'Scan from gallery',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7f60n8l0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // PaymentCard
  {
    'yenct0rm': {
      'en': 'Reload',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5z8gn7lz': {
      'en': 'Reload',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lsfvp343': {
      'en': 'RM 100',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5t0b1u9m': {
      'en': 'Don\'t worry your data is protected \n according to law',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bcapa1wp': {
      'en': 'Card  Number',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n108zjbl': {
      'en': 'We currently accept ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3wtjr0gj': {
      'en': 'MM/YY',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4mh7cxab': {
      'en': 'CVV/CVV2',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lfwm6kcb': {
      'en': 'Save Card',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xhl2hjdw': {
      'en': 'Reload Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5ih0ia0b': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Role
  {
    '5zsbgqpb': {
      'en': 'Roles',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hdua1bm1': {
      'en': 'Parent',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ofsjhmia': {
      'en': 'Children',
      'ar': '',
      'de': '',
      'es': '',
    },
    'snlypjs0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // QRCodePage
  {
    'i4nqui8y': {
      'en': 'Make Payment',
      'ar': 'بطاقتي',
      'de': 'Meine Karte',
      'es': 'Mi tarjeta',
    },
    '8eef2he8': {
      'en': 'Please wait until the transaction\'s complete',
      'ar': '',
      'de': '',
      'es': '',
    },
    '05v72tp9': {
      'en': 'Tap on code to zoom in',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ep38qy0i': {
      'en': 'Wallet Balance: RM 100.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '12uxdkka': {
      'en': 'Top Up',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yz2tz5z1': {
      'en': 'Or pay by scanning QR code',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9uejyh4c': {
      'en': 'Open Scanner',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0qu372pv': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // PaymentPage
  {
    'geeodqpe': {
      'en': 'Sarween',
      'ar': 'بطاقتي',
      'de': 'Meine Karte',
      'es': 'Mi tarjeta',
    },
    'ule72rrx': {
      'en': 'Child',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xa912klq': {
      'en': 'SARWEEN ALAGES',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'fb33l6h0': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'c2qjqcim': {
      'en': 'RM 100.00',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'fk6kcsj9': {
      'en': 'Pay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cbaaykxl': {
      'en': 'Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    '1x4tppkd': {
      'en': 'Finance',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'bjn5e039': {
      'en': 'Track your transaction',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yok1339e': {
      'en': 'Challenge',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'pdrpxi4a': {
      'en': 'Complete the challenges',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jsgo7own': {
      'en': 'Learning',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'dg8979on': {
      'en': 'Learn the financial skills',
      'ar': '',
      'de': '',
      'es': '',
    },
    'urzcygeg': {
      'en': 'Account',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    's0wkdpta': {
      'en': 'Manage your account',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2fctcr0k': {
      'en': 'Recommended Activities',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'ja5ddt0e': {
      'en': 'Track your expenditure',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qssx192n': {
      'en': 'You have spent more than RM 50 this week',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'ki9vbxrx': {
      'en': 'Continue your challenge',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0zkycysm': {
      'en': 'Challenge: Budget Listing',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'hk6fn02s': {
      'en': 'Learn new financial tips',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j37n37ax': {
      'en': 'Article: Learn financial tips in 5 mins',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'of127833': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // PaymentSuccesfulPage
  {
    'w5wm6ja3': {
      'en': 'Make Payment',
      'ar': 'بطاقتي',
      'de': 'Meine Karte',
      'es': 'Mi tarjeta',
    },
    'pm5l6oz2': {
      'en': 'Payment Successful',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rzh796py': {
      'en': 'Payment Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6fm2wmlz': {
      'en': 'Total Payment:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mcovv1gz': {
      'en': 'RM 10.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l4nd75g6': {
      'en': 'Date & Time:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dtd1fkyy': {
      'en': '9/9/2023, 19:11 pm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p4nlg529': {
      'en': 'Category:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bla65o5m': {
      'en': 'None',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mddyzrbk': {
      'en': 'Remaining Balance: RM 90.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0lxz3yv8': {
      'en': 'Done',
      'ar': '',
      'de': '',
      'es': '',
    },
    '411hntq0': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // articlepageCopy
  {
    'h7yxvbg3': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yae3f0m1': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bbebn13p': {
      'en': 'Article',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7770uq9m': {
      'en': 'Media',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gzm5v6be': {
      'en': 'Learn to Plan your Budget',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bvpamm33': {
      'en': 'Jackson Hewiit',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u225mmw8': {
      'en': '24',
      'ar': '',
      'de': '',
      'es': '',
    },
    't381n9yj': {
      'en': '1h',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rmh5l0dq': {
      'en': 'Read Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lnksg7oi': {
      'en': 'Basic of Cashflow',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xefdk83g': {
      'en': 'Andy Brown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cdlddnr9': {
      'en': '13',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ceotdl0i': {
      'en': '4h',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cwhdltnb': {
      'en': 'Read Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    '03d3eurw': {
      'en': 'Mastering Personal Finance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ts1ps8ay': {
      'en': 'Greg Donald',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p78suiec': {
      'en': '22',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f469ibfw': {
      'en': '7h',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hou0f0oa': {
      'en': 'Read Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pqdefpbn': {
      'en': 'Sustainable Investing',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j7zwj639': {
      'en': 'Joseph Style',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zvok73y6': {
      'en': '35',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j0p11063': {
      'en': '18h',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jl949c36': {
      'en': 'Read Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'soo7xe8e': {
      'en': 'Financial Responsibility Starts at Home',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kloqwkqo': {
      'en': 'Barry Jame',
      'ar': '',
      'de': '',
      'es': '',
    },
    '00k0y9y9': {
      'en': '46',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hd9evlqu': {
      'en': '1d',
      'ar': '',
      'de': '',
      'es': '',
    },
    '66htausm': {
      'en': 'Read Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qu02e32i': {
      'en': '•',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // articlepageDetailCopy
  {
    'nragkwrv': {
      'en': 'Learn to Plan your Budget',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'l1bxbbu3': {
      'en': 'by Jackson Hewiit',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6y9t77xq': {
      'en':
          'Budgeting is a cornerstone of financial responsibility, offering you the roadmap to manage your finances efficiently. It begins with a comprehensive assessment of your financial situation, where you gather all your income sources, expenses, bills, and financial records. This holistic view enables you to set clear and realistic financial goals, which could range from paying off debts to saving for a dream vacation or building an emergency fund. These goals give purpose and direction to your budgeting efforts.\n\nWith your financial objectives in place, the next step is to create a budget. Start by cataloging all your monthly expenses, distinguishing between fixed costs like rent, utilities, and loan payments, and variable expenses such as groceries, dining out, and entertainment. It\'s imperative to differentiate between needs and wants, prioritizing the former in your budget.\n\nTo stay on course with your budget, diligent tracking of your expenses is vital. Many people find it useful to use budgeting apps or tools to monitor their spending habits closely. Additionally, working towards the establishment of an emergency fund is essential, as it acts as a financial safety net for unexpected situations, offering peace of mind and financial stability.\n\nDiscipline plays a pivotal role in budgeting success. Avoiding impulsive purchases and making informed spending decisions are crucial aspects of adhering to your budget. Periodically reviewing and adjusting your budget is equally important, especially as your financial situation evolves over time. As you practice and commit to budgeting, you\'ll find it to be a powerful tool that not only ensures financial stability but also helps you achieve your financial aspirations.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qenjmau0': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // articlepageMediaCopy
  {
    'vbq5aavg': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7k418dcd': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qiqs7990': {
      'en': 'Article',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nrezrnog': {
      'en': 'Media',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lvir0msd': {
      'en': 'Basics of Cashflow',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1sag8kpc': {
      'en': 'Like',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h83r6q53': {
      'en': 'Share',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4n1qd649': {
      'en': 'Grow your Finance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lc3gdgm1': {
      'en': 'Like',
      'ar': '',
      'de': '',
      'es': '',
    },
    '91sichuf': {
      'en': 'Share',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0pkr06dc': {
      'en': 'Investing For Beginner',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vxekemij': {
      'en': 'Like',
      'ar': '',
      'de': '',
      'es': '',
    },
    '622bm6jg': {
      'en': 'Share',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j7zekpmy': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Challenge_ToDo
  {
    '2zxq8p86': {
      'en': '279',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z98gm90i': {
      'en': 'Completed Challenges',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vilambx3': {
      'en': 'Current Challenge',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b39026vf': {
      'en': 'Budget Listing',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0f0rjh91': {
      'en': 'Easy',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7p3tgyrm': {
      'en': 'List down the price of items and foods that you bought in a week ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ix1x2lfm': {
      'en': '3 days 23 hours left',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ijns6fs4': {
      'en': '15',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h4eewpyz': {
      'en': 'Money Allocation',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3brbmz2h': {
      'en': 'Medium',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tklax9yr': {
      'en':
          'You have to allocate the money given by parents wisely and show the report to your parents',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cb4atcbs': {
      'en': '5 days 15 hours left',
      'ar': '',
      'de': '',
      'es': '',
    },
    '34m6hisd': {
      'en': '25',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lxuxh61e': {
      'en': 'Challenges',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'wp3w9sig': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // Challenge_Preset
  {
    'ueg8zf5o': {
      'en': 'Challenges',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uyejfooy': {
      'en': 'Emergency Fund',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0efb6e18': {
      'en': 'Easy',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v380goq6': {
      'en':
          'Plan for unexpected expenses. Start saving for unexpected expenses ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '55r5j51v': {
      'en': '15',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9c2lvqfv': {
      'en': 'Assign',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ub8lod56': {
      'en': 'Invest in the Future',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rbvq4ftt': {
      'en': 'Hard',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h0yhxnzy': {
      'en': 'Company Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'po376yi8': {
      'en': 'List down the price of items and foods that you bought in a week ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sxrxatph': {
      'en': '30',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vgznpexz': {
      'en': 'Assign',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j8ixplgn': {
      'en': 'Available Challenges',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'aauwfpxq': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // Challenge_History
  {
    'j3gdu73t': {
      'en': 'Completed Challenge',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5dz3o2nt': {
      'en': 'Emergency Fund',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ktvaqwmj': {
      'en': 'Easy',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pao26jiy': {
      'en': 'Company Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ojdp1ubh': {
      'en':
          'Plan for unexpected expenses. Start saving for unexpected expenses ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xgaw4fk6': {
      'en': '15',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lhpr5lqb': {
      'en': 'Tuesday, Jan. 29',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xrtqdwsm': {
      'en': 'Apply',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ye7hb8hh': {
      'en': 'Invest in the Future',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wa8hbluo': {
      'en': 'Hard',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v6ec6o64': {
      'en': 'List down the price of items and foods that you bought in a week ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bj2v1h16': {
      'en': '30',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3epqtsox': {
      'en': 'Challenge History',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'msf8myo8': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // Challenge_CompleteChild
  {
    '17jd1eh4': {
      'en': 'Budget Listing',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jt4yg01p': {
      'en': 'Easy',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9lc5vblb': {
      'en': 'Challenge Completed ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q9lx1d8w': {
      'en': '15',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jeaphzfq': {
      'en': 'OK',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mj7shxe6': {
      'en': 'Congratulations',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'm1xgxg20': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // bookAppointment
  {
    'sfzj3riz': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    '4skzh9os': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'b87tcas2': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    '5tkkg4yu': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '7w5m45zt': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'bmfmxg71': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'prt95f0g': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    '7ohalsg9': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    'xukiv2ku': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    'lpc88cht': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'b5umyycx': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // bookingOld
  {
    '8laf5zmk': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    'udwhsu8p': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'hdmqdmzq': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    'stpxpct6': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'wvgk6obb': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'xt7ujyt8': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'andpn0t0': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
  },
  // editBooking
  {
    '6j668hma': {
      'en': 'Edit Appointment',
      'ar': 'تحرير موعد',
      'de': 'Termin bearbeiten',
      'es': 'Editar cita',
    },
    'cbp936ta': {
      'en': 'Edit the fields below in order to change your appointment.',
      'ar': 'قم بتحرير الحقول أدناه لتغيير موعدك.',
      'de': 'Bearbeiten Sie die Felder unten, um Ihren Termin zu ändern.',
      'es': 'Edite los campos a continuación para cambiar su cita.',
    },
    '6btfslje': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'mhko6q8p': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'shqcgjqe': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '5ixhbnsd': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'db46hhfw': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'e1zm6kzh': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'oy6qvd33': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    '9emhgrhs': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija Fecha',
    },
    '2bzoinpy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'gjnq0j86': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
  },
  // pauseCard
  {
    'dt7m486y': {
      'en': 'Pause Card',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    '6edae99k': {
      'en': 'Are you sure you want to pause your card?',
      'ar': 'هل أنت متأكد أنك تريد إيقاف بطاقتك مؤقتًا؟',
      'de': 'Möchten Sie Ihre Karte wirklich pausieren?',
      'es': '¿Seguro que quieres pausar tu tarjeta?',
    },
    'omtrfcm5': {
      'en': 'Nevermind',
      'ar': 'لا بأس',
      'de': 'egal',
      'es': 'No importa',
    },
    'hw07mkb9': {
      'en': 'Yes, Pause',
      'ar': 'نعم توقف',
      'de': 'Ja, Pause',
      'es': 'Sí, pausa',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
