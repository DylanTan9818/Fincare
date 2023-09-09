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
  // loginPage
  {
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // registerAccount
  {
    'gpokmd81': {
      'en': 'Register Child Account',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'gcwdqm4g': {
      'en': 'Nickname',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'iam0xgwx': {
      'en': 'Nickname',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'bqv15dcf': {
      'en': 'Full Name',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'joih97mn': {
      'en': 'Full Name as NRIC',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'rzpiwq9p': {
      'en': 'NRIC No',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Kennwort bestätigen',
      'es': 'Confirmar contraseña',
    },
    'eyfkffka': {
      'en': 'NRIC without \'\'-\'\'',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'bwzkje51': {
      'en': 'Date Of Birth',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Kennwort bestätigen',
      'es': 'Confirmar contraseña',
    },
    '6fti061t': {
      'en': 'DD/MM/YYYY',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'p29umzq9': {
      'en': 'Phone Number',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Kennwort bestätigen',
      'es': 'Confirmar contraseña',
    },
    'uwdylt9b': {
      'en': '+60xxxxxxxxx',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    '5kmjfwsk': {
      'en': 'Add Child',
      'ar': 'إنشاء حساب',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
    },
    'momge5oj': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'r6npjsue': {
      'en': 'Upload a photo for us to easily identify you.',
      'ar': 'قم بتحميل صورة لنا للتعرف عليك بسهولة.',
      'de':
          'Laden Sie ein Foto hoch, damit wir Sie leicht identifizieren können.',
      'es': 'Sube una foto para que te identifiquemos fácilmente.',
    },
    'sdptn7dd': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'n636qnrx': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    's7yvjzbs': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    '72ii0waq': {
      'en': 'Your Title',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'pf8glhkg': {
      'en': 'What is your position?',
      'ar': 'ماهوموقعك؟',
      'de': 'Wo befinden Sie sich?',
      'es': '¿Cual es tu posicion?',
    },
    'hbhd3bdt': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'w75dikic': {
      'en': 'Skip for Now',
      'ar': 'تخطي في الوقت الراهن',
      'de': 'Für jetzt überspringen',
      'es': 'Saltar por ahora',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'xaiad71o': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Bestätigungscode.',
      'es':
          'Introduce el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
    },
    'u4nuk910': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '37kotxi0': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'hiwpaze1': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // onboarding
  {
    'i8hl2uua': {
      'en': 'Create Budgets',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    'hxtwax0y': {
      'en':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'mjy3ljln': {
      'en': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
    },
    'uf9k1spp': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    '9c4outzf': {
      'en': 'Budget Analysis',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
    },
    'q30ina4f': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'ypt7b97g': {
      'en': 'Create Your Budget',
      'ar': 'إنشاء ميزانيتك',
      'de': 'Erstellen Sie Ihr Budget',
      'es': 'Crea tu presupuesto',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
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
  // paymentDetails
  {
    'j0yzgf4n': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'de': 'Einzelheiten',
      'es': 'Detalles',
    },
    'zv72ekdw': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    '0rjyjwed': {
      'en': 'Vendor',
      'ar': 'بائع',
      'de': 'Verkäufer',
      'es': 'Vendedor',
    },
    'eeyn6dk2': {
      'en': 'When',
      'ar': 'متى',
      'de': 'Wann',
      'es': 'Cuándo',
    },
    'lccxx6eu': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'jzyax4hn': {
      'en': 'Spent by',
      'ar': 'أنفقه',
      'de': 'Verbracht von',
      'es': 'gastado por',
    },
    'i4r9jqwn': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_profilePage
  {
    'f1bvbey3': {
      'en': 'My Account',
      'ar': 'حسابي',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
    },
    'i61y9ibx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    '03k0vw86': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '6w6wv95p': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
      'de': 'Benachrichtigungseinstellungen',
      'es': 'Configuración de las notificaciones',
    },
    '9aogde79': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    'eojlfs66': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    '2ll42t1u': {
      'en': 'Dark Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8d386226': {
      'en': 'Light Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8srr2k0j': {
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
  // transferComplete
  {
    'xf8d4sm8': {
      'en': 'Transfer Complete',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'iq9jjji8': {
      'en':
          'Great work, you successfully transferred funds. It may take a few days for the funds to leave your account.',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transferFunds
  {
    'pe3o18oh': {
      'en': 'Transfer Funds',
      'ar': 'تحويل الأموال',
      'de': 'Geld überweisen',
      'es': 'Transferir fondos',
    },
    'kyzwrfh4': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'zq4ozx20': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'qukh7yo1': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'n87hkr7d': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    '3ct4fj7p': {
      'en': 'Change Account',
      'ar': 'تغير الحساب',
      'de': 'Account wechseln',
      'es': 'Cambiar cuenta',
    },
    'w4smsh2i': {
      'en': 'Internal Transfer',
      'ar': 'التحويل الداخلي',
      'de': 'Interner Transfer',
      'es': 'Transferencia interna',
    },
    '6uxty3hy': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'p4ngma0d': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'uxo87fjc': {
      'en': 'Transfer Type',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fddma8xl': {
      'en': 'Select Account',
      'ar': 'حدد حساب',
      'de': 'Konto auswählen',
      'es': 'Seleccionar cuenta',
    },
    '23l6kqgm': {
      'en': 'Account ****2010',
      'ar': 'الحساب **** 2010',
      'de': 'Konto ****2010',
      'es': 'Cuenta ****2010',
    },
    '3hwdfadf': {
      'en': 'Account ****2011',
      'ar': 'الحساب **** 2011',
      'de': 'Konto ****2011',
      'es': 'Cuenta ****2011',
    },
    'xvj00xg1': {
      'en': 'Account ****2012',
      'ar': 'الحساب **** 2012',
      'de': 'Konto ****2012',
      'es': 'Cuenta ****2012',
    },
    'ok5xluvk': {
      'en': 'Choose an Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ynie0pc5': {
      'en': '\$ Amount',
      'ar': 'المبلغ بالدولار',
      'de': '\$ Betrag',
      'es': '\$ Monto',
    },
    'wngoi0v4': {
      'en': 'Your new account balance is:',
      'ar': 'رصيد حسابك الجديد هو:',
      'de': 'Ihr neuer Kontostand beträgt:',
      'es': 'El nuevo saldo de su cuenta es:',
    },
    'g6bfec2g': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'xaw2jdst': {
      'en': 'Send Transfer',
      'ar': 'أرسل حوالة',
      'de': 'Überweisung senden',
      'es': 'Enviar transferencia',
    },
    'xku4zxbe': {
      'en': 'Tap above to complete transfer',
      'ar': 'اضغط أعلاه لإكمال النقل',
      'de': 'Tippen Sie oben, um die Übertragung abzuschließen',
      'es': 'Toque arriba para completar la transferencia',
    },
    'imaejg7x': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // requestFunds
  {
    'wv1862li': {
      'en': 'Request Funds',
      'ar': 'طلب التمويل',
      'de': 'Geld anfordern',
      'es': 'Pedír fondos',
    },
    'xvj3fan8': {
      'en': '\$ Amount',
      'ar': 'المبلغ بالدولار',
      'de': '\$ Betrag',
      'es': '\$ Monto',
    },
    'wwjahvpl': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    'sx0vvzxd': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'ai453kej': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'wo9cebk7': {
      'en': 'Select Transfer',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rcevwwju': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'uvrt7im0': {
      'en': 'Request Funds',
      'ar': 'طلب التمويل',
      'de': 'Geld anfordern',
      'es': 'Pedír fondos',
    },
    '7y89msg9': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'xk0bwox3': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // createBudget
  {
    'mos068mm': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transaction_ADD
  {
    'qywon4k1': {
      'en': 'Add Transaction',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'bh9tad8e': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'ohewrgsv': {
      'en': 'Spent At',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    '3170k9n1': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    'abz6nm8z': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    '3y95vtb6': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    '861el4k4': {
      'en': 'Select Budget',
      'ar': 'حدد الميزانية',
      'de': 'Wählen Sie Budget aus',
      'es': 'Seleccionar presupuesto',
    },
    'swxms7ln': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'uqfgu088': {
      'en': 'Add Transaction',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    '9stmpsf0': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'gzhmf1t6': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '7trcsuiu': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transaction_EDIT
  {
    's300dyxl': {
      'en': 'Edit Transaction',
      'ar': 'تحرير المعاملة',
      'de': 'Transaktion bearbeiten',
      'es': 'Editar transacción',
    },
    '5xgwlwjj': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    '720k2d98': {
      'en': 'Spent At',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    'df1ingy2': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    '5kzmka3y': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'nvtz0bpd': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'l3bqo3oh': {
      'en': 'Select Budget',
      'ar': 'حدد الميزانية',
      'de': 'Wählen Sie Budget aus',
      'es': 'Seleccionar presupuesto',
    },
    '0lw03w43': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    '3eftlbxd': {
      'en': 'Update Transaction',
      'ar': 'تحديث المعاملة',
      'de': 'Transaktion aktualisieren',
      'es': 'Actualizar transacción',
    },
    '4atjd0yh': {
      'en': 'Tap above to save your changes.',
      'ar': 'اضغط أعلاه لحفظ التغييرات الخاصة بك.',
      'de': 'Tippen Sie oben, um Ihre Änderungen zu speichern.',
      'es': 'Toca arriba para guardar tus cambios.',
    },
    'pg18rcyu': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '12if11ss': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // editProfile
  {
    '4rzqov3y': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    'zoxan2gi': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
    },
    '3p9y21e2': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'dw9gmjdc': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
      'de': 'Bitte geben Sie eine gültige Nummer ein...',
      'es': 'Por favor ingrese un número valido...',
    },
    'z4fstn5l': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'jozgvwyg': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
      'de': 'Deine E-Mail',
      'es': 'Tu correo electrónico',
    },
    '8h1cjk5a': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    '5v21r6gb': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    'zvymbfia': {
      'en': 'Your Title',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'i6edcl52': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    '59naq8ur': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '2b97u8y5': {
      'en':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'ar':
          'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.',
      'es':
          'Ingrese el correo electrónico asociado con su cuenta y le enviaremos un enlace para restablecer su contraseña.',
    },
    'ajy1c3r9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'if4pz6lm': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // notificationsSettings
  {
    'sc4ff4ce': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'r72zvrv5': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': 'اختر الإشعارات التي تريد تلقيها أدناه وسنقوم بتحديث الإعدادات.',
      'de':
          'Wählen Sie unten aus, welche Benachrichtigungen Sie erhalten möchten, und wir aktualisieren die Einstellungen.',
      'es':
          'Elija qué notificaciones desea recibir a continuación y actualizaremos la configuración.',
    },
    'gjygkr0n': {
      'en': 'Push Notifications',
      'ar': 'دفع الإخطارات',
      'de': 'Mitteilungen',
      'es': 'Notificaciones push',
    },
    '3y3yhxbk': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': 'تلقي إشعارات من تطبيقنا على أساس شبه منتظم.',
      'de':
          'Erhalten Sie regelmäßig Push-Benachrichtigungen von unserer Anwendung.',
      'es':
          'Reciba notificaciones Push de nuestra aplicación de forma semi regular.',
    },
    '1ytebj35': {
      'en': 'Email Notifications',
      'ar': 'اشعارات البريد الالكتروني',
      'de': 'E-Mail Benachrichtigungen',
      'es': 'Notificaciónes de Correo Electrónico',
    },
    '9lvh5nst': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'ar':
          'تلقي إشعارات البريد الإلكتروني من فريق التسويق لدينا حول الميزات الجديدة.',
      'de':
          'Erhalten Sie E-Mail-Benachrichtigungen von unserem Marketingteam über neue Funktionen.',
      'es':
          'Reciba notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
    },
    '69d2j74u': {
      'en': 'Location Services',
      'ar': 'خدمات الموقع',
      'de': 'Standortdienste',
      'es': 'Servicios de localización',
    },
    '3k8cuv0d': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'ar':
          'اسمح لنا بتتبع موقعك ، فهذا يساعد على تتبع الإنفاق ويحافظ على سلامتك.',
      'de':
          'Erlauben Sie uns, Ihren Standort zu verfolgen, dies hilft, die Ausgaben im Auge zu behalten und schützt Sie.',
      'es':
          'Permítanos rastrear su ubicación, esto ayuda a realizar un seguimiento de los gastos y lo mantiene seguro.',
    },
    'isgrgbfs': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    'a96mlyeh': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    'fvsfg5on': {
      'en': 'How we use your data',
      'ar': 'كيف نستخدم بياناتك',
      'de': 'Wie wir Ihre Daten verwenden',
      'es': 'Cómo usamos sus datos',
    },
    'nbiyrnzl': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'ar':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. غير consectetur a erat nam. دونك ألتريسيس تينسيدونت قوس غير مخادع. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis في erat pellentesque adipiscing. موريس نونك كونيج سيرة ذاتية. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia في quis risus sed vulputate odio. فيليت كريمينسيم sodales ut eu sem سيرة ذاتية صحيحة justo eget. Risus feugiat في ما قبل ميتوس. Leo vel orci porta non pulvinar neque laoreet suspension interdum. Suscipit Tellus mauris a Diam Maecenas Sed enim ut sem. SEM السيرة الذاتية الصحيحة justo eget magna fermentum iaculis eu. لاسينيا في quis risus sed. Faucibus purus في ماسا مؤقت. ليو بقطر سوليتودين معرف مؤقت الاتحاد الأوروبي. Nisi scelerisque eu ultrices السيرة الذاتية موصل. Vulputate كريم معلق في وقت مبكر. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus Préium quam vulputate. Elit pellentesque موطن morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. sit amet mattis vulputate enim nulla. Nisi lacus sed viverra Tellus في العادة السيئة. اجلس أميت ريسوس نولام إيجيت فيليس إيجيت نونك لوبورتيز. Pretium lectus quam id leo in vitae. Adipiscing Diam donec adipiscing tristique. كومودو سيد egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing النخبة pellentesque المعيشية morbi. مونتيس ناسيتور ريديكولوس موس موريس. Ut etiam sit amet nisl purus in. Arcu ac Ornare suspendisse sed nisi lacus sed viverra.',
      'de':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis bei erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia bei quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem entero vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus en massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Cómodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
    },
    'oks4x95o': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // tutorial_PROFILE
  {
    '38wb3rix': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    'o6prpb1q': {
      'en': 'Create Budgets',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    '292pbdw7': {
      'en':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'b10xvuf9': {
      'en': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
    },
    't6k1smsm': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    'u8xxj427': {
      'en': 'Budget Analysis',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
    },
    'iqi0pkmb': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'uydm0fnm': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homePage_alt
  {
    'xdh0z8qh': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'v74pa882': {
      'en': 'Andrew',
      'ar': 'أندرو',
      'de': 'Andreas',
      'es': 'Andrés',
    },
    'rzpg3cvh': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'flto6ti8': {
      'en': 'Total Balance',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    'g07h0azf': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'v9ghmn0y': {
      'en': 'Total Balance',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    '7vf40ybo': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'k4scs2cu': {
      'en': 'Total Balance',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    'cvrbfozm': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'a33ldz0h': {
      'en': 'Next Payroll',
      'ar': 'كشوف المرتبات التالية',
      'de': 'Nächste Gehaltsabrechnung',
      'es': 'Nómina siguiente',
    },
    '3dgzzz79': {
      'en': '\$25,281',
      'ar': '25281 دولارًا',
      'de': '25.281 \$',
      'es': '\$25,281',
    },
    'hp28r17l': {
      'en': 'Debit Date',
      'ar': 'تاريخ الخصم',
      'de': 'Belastungsdatum',
      'es': 'Fecha de débito',
    },
    'k04gl6sz': {
      'en': 'Aug 31, 2021',
      'ar': '31 أغسطس 2021',
      'de': '31. August 2021',
      'es': '31 de agosto de 2021',
    },
    'd5tcdo3w': {
      'en': '4 days left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '8wofym4i': {
      'en': '1 New Alert',
      'ar': '1 تنبيه جديد',
      'de': '1 Neue Benachrichtigung',
      'es': '1 nueva alerta',
    },
    'kaq4nzj6': {
      'en': 'Fraud Alert',
      'ar': 'تنبيه الاحتيال',
      'de': 'Betrugsalarm',
      'es': 'Alerta de fraude',
    },
    '7zcrtqx6': {
      'en':
          'We noticed a small charge that is out of character of this account, please review.',
      'ar': 'لقد لاحظنا تكلفة صغيرة خارجة عن طبيعة هذا الحساب ، يرجى المراجعة.',
      'de':
          'Wir haben eine kleine Belastung festgestellt, die für dieses Konto untypisch ist. Bitte überprüfen Sie diese.',
      'es':
          'Notamos un pequeño cargo que está fuera de lugar en esta cuenta, revíselo.',
    },
    '23yxoc9m': {
      'en': 'View Now',
      'ar': 'عرض الآن',
      'de': 'Jetzt ansehen',
      'es': 'Ver ahora',
    },
    'a86mwddx': {
      'en': 'Marketing Budget',
      'ar': 'ميزانية التسويق',
      'de': 'Werbehaushalt, Werbebudget',
      'es': 'Presupuesto de marketing',
    },
    '6c2o39hz': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    '5subrra4': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    '0wtm2m51': {
      'en': '\$2,502',
      'ar': '2،502 دولار',
      'de': '2.502 \$',
      'es': '\$2,502',
    },
    'bp9d56pc': {
      'en': '4 days left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    'b8oj0pck': {
      'en': 'Team Name',
      'ar': 'اسم الفريق',
      'de': 'Teamname',
      'es': 'Nombre del equipo',
    },
    '87ospwsq': {
      'en': '\$5,000',
      'ar': '5000 دولار',
      'de': '5.000 \$',
      'es': '\$5,000',
    },
    'jzfejglt': {
      'en': 'Head of Design',
      'ar': 'رئيس قسم التصميم',
      'de': 'Leiter Design',
      'es': 'Jefe de Diseño',
    },
    'zm0lhm2a': {
      'en': '[Time Stamp]',
      'ar': '[الطابع الزمني]',
      'de': '[Zeitstempel]',
      'es': '[Marca de tiempo]',
    },
    '8hu2v2im': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // budget_DELETE
  {
    'pozov0xz': {
      'en': 'Delete Budget',
      'ar': 'حذف الميزانية',
      'de': 'Budget löschen',
      'es': 'Eliminar presupuesto',
    },
    'aptjmof0': {
      'en':
          'If you delete this budget, your transactions will no longer be associated with it.',
      'ar': 'إذا حذفت هذه الميزانية ، فلن تكون معاملاتك مرتبطة بها بعد الآن.',
      'de':
          'Wenn Sie dieses Budget löschen, sind Ihre Transaktionen nicht mehr damit verknüpft.',
      'es':
          'Si elimina este presupuesto, sus transacciones ya no estarán asociadas a él.',
    },
    '9l7pbjcj': {
      'en': 'Delete Budget',
      'ar': 'حذف الميزانية',
      'de': 'Budget löschen',
      'es': 'Eliminar presupuesto',
    },
    'u0kr38at': {
      'en': 'Tap above to remove this bude',
      'ar': 'انقر فوق لإزالة هذا bude',
      'de': 'Tippen Sie oben, um diese Bude zu entfernen',
      'es': 'Toque arriba para eliminar este bude',
    },
    'b1xp801p': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // profilepage
  {
    'hhb6veym': {
      'en': 'Wallet Balance',
      'ar': 'رصيد المحفظة',
      'de': 'Wallet-Guthaben',
      'es': 'Saldo de la cartera',
    },
    'fgf8icmv': {
      'en': '\$23,000',
      'ar': '23000 دولار',
      'de': '23.000 \$',
      'es': '\$23,000',
    },
    '2rrr446m': {
      'en': '3 currencies',
      'ar': '3 عملات',
      'de': '3 Währungen',
      'es': '3 monedas',
    },
    'r04m9nxs': {
      'en': 'My Bank',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    '8nac51xz': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    's56t3xya': {
      'en': 'Activity',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'vewa5op5': {
      'en': 'Bitcoin',
      'ar': 'بيتكوين',
      'de': 'Bitcoin',
      'es': 'Bitcoin',
    },
    '9oun2uok': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    'yla7uncg': {
      'en': '32% of portfolio',
      'ar': '32٪ من المحفظة',
      'de': '32 % des Portfolios',
      'es': '32% de la cartera',
    },
    '7hsm7t9z': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'opob20j8': {
      'en': 'Solona',
      'ar': 'سولونا',
      'de': 'Solona',
      'es': 'Soloña',
    },
    'fi3cleyj': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    '606emxw1': {
      'en': '40% of portfolio',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    'qx0ykpbm': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l2io5lul': {
      'en': 'Dogecoin',
      'ar': 'دوجكوين',
      'de': 'Dogecoins',
      'es': 'dogecoin',
    },
    'krsyyttw': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    '4mvfe3pe': {
      'en': '40% of portfolio',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    '6cm4jjje': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vox9t1s0': {
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
    'iicnw3dq': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
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
    'm6f5lawq': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'yz52729g': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
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
    'ycaso9dc': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    '2pmd2p3w': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    '13j05r8j': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
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
