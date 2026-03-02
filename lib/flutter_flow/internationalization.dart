import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ja', 'en'];

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
    String? jaText = '',
    String? enText = '',
  }) =>
      [jaText, enText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'mqukpzng': {
      'ja': 'Voka Note',
      'en': '',
    },
    'sem1oqyh': {
      'ja': 'メール',
      'en': '',
    },
    '91njhnb3': {
      'ja': 'パスワード',
      'en': '',
    },
    'vq2i1fbq': {
      'ja': 'アカウントをお持ちでない方',
      'en': '',
    },
    'w2mf1yj5': {
      'ja': 'パスワードを忘れた方',
      'en': '',
    },
    'rpea3q9y': {
      'ja': 'Home',
      'en': '',
    },
  },
  // TopPage
  {
    's7mghps8': {
      'ja': '学習済み',
      'en': '',
    },
    'lvorx0ux': {
      'ja': '品詞',
      'en': '',
    },
    '022mt9jl': {
      'ja': '検索',
      'en': '',
    },
    'b17jkaiz': {
      'ja': '名詞',
      'en': '',
    },
    'pynn813f': {
      'ja': '代名詞',
      'en': '',
    },
    'xs151gf7': {
      'ja': '数詞',
      'en': '',
    },
    'aybsllzl': {
      'ja': '冠形詞',
      'en': '',
    },
    'z8gvrt06': {
      'ja': '副詞',
      'en': '',
    },
    '1o9lcump': {
      'ja': '助詞',
      'en': '',
    },
    'lanqcqjh': {
      'ja': '感嘆詞',
      'en': '',
    },
    'qjnab9i3': {
      'ja': '動詞',
      'en': '',
    },
    'yj626cqy': {
      'ja': '形容詞',
      'en': '',
    },
    'aie3tark': {
      'ja': '文法',
      'en': '',
    },
    'e3g5meq9': {
      'ja': '全て',
      'en': '',
    },
    'qnh9c30b': {
      'ja': '単語',
      'en': '',
    },
    'x6ve4mcf': {
      'ja': 'Home',
      'en': '',
    },
  },
  // addPage
  {
    'b2zozhmp': {
      'ja': '品詞',
      'en': '',
    },
    'x9yv7fcg': {
      'ja': '検索',
      'en': '',
    },
    'u1kxfw9b': {
      'ja': '名詞',
      'en': '',
    },
    'w8hvgnel': {
      'ja': '代名詞',
      'en': '',
    },
    'qnrge21e': {
      'ja': '数詞',
      'en': '',
    },
    'ednfrawu': {
      'ja': '冠形詞',
      'en': '',
    },
    'yjkr40bg': {
      'ja': '副詞',
      'en': '',
    },
    'hzgixu5a': {
      'ja': '助詞',
      'en': '',
    },
    '8iue1orf': {
      'ja': '感嘆詞',
      'en': '',
    },
    'cj9umptk': {
      'ja': '動詞',
      'en': '',
    },
    '6ghvcnds': {
      'ja': '形容詞',
      'en': '',
    },
    '1vejq16f': {
      'ja': '文法',
      'en': '',
    },
    'm39sjj5w': {
      'ja': '追加',
      'en': '',
    },
    'lvhbb742': {
      'ja': '追加',
      'en': '',
    },
    '2eo7wskk': {
      'ja': 'Home',
      'en': '',
    },
  },
  // contentPage
  {
    '0mthqrmd': {
      'ja': '単語 / 文法',
      'en': '',
    },
    'cdtnz3jt': {
      'ja': '品詞',
      'en': '',
    },
    'an5smflv': {
      'ja': '意味',
      'en': '',
    },
    'wzie2bjd': {
      'ja': '例文',
      'en': '',
    },
    'ig7mli1k': {
      'ja': '例文訳',
      'en': '',
    },
    'mv5apa30': {
      'ja': '意味',
      'en': '',
    },
    'b24b78dk': {
      'ja': 'Home',
      'en': '',
    },
  },
  // signUpPage
  {
    '6oqfrx8i': {
      'ja': 'Voka Noteへようこそ',
      'en': '',
    },
    'qpi921lh': {
      'ja': 'メール',
      'en': '',
    },
    'nzfdikz2': {
      'ja': 'パスワード',
      'en': '',
    },
    '0zlzm2xc': {
      'ja': 'パスワードをもう一度入力してください',
      'en': '',
    },
    'mwncrmhk': {
      'ja': '利用規約',
      'en': '',
    },
    'x1shihdg': {
      'ja': 'xxxxxxxx',
      'en': '',
    },
    'l7r6mewr': {
      'ja': 'プライバシーポリシー',
      'en': '',
    },
    'm1dyro2c': {
      'ja': 'xxxxxxxx',
      'en': '',
    },
    'gu5lny5w': {
      'ja': '上記に同意する',
      'en': '',
    },
    '40gk6bey': {
      'ja': 'Home',
      'en': '',
    },
  },
  // contactPage
  {
    '8meehrlb': {
      'ja': 'メール',
      'en': '',
    },
    '211szclj': {
      'ja': '件名',
      'en': '',
    },
    'qu8epfz1': {
      'ja': '内容',
      'en': '',
    },
    '56y1qgbp': {
      'ja': 'お問い合わせ',
      'en': '',
    },
    'zpx5c1xs': {
      'ja': 'Home',
      'en': '',
    },
  },
  // accountDeletePage
  {
    'iauoh4yp': {
      'ja': 'アカウントを削除しますか？',
      'en': '',
    },
    'myke1apm': {
      'ja':
          'アカウントを削除すると、これまで登録したすべての単語帳データ、学習ログ、楽曲のリコメンド履歴が完全に消去されます。この操作は取り消すことができません。本当に削除してもよろしいですか？\n削除するには下の入力欄に『削除』と入力し、削除を押してください。',
      'en': '',
    },
    '3vikoou7': {
      'ja': '削除',
      'en': '',
    },
    '0j1mm0nt': {
      'ja': '削除',
      'en': '',
    },
    'qa69u8m5': {
      'ja': 'アカウント削除',
      'en': '',
    },
    'acamrvhf': {
      'ja': 'Home',
      'en': '',
    },
  },
  // updatePage
  {
    'vqzn6h5s': {
      'ja': '品詞',
      'en': '',
    },
    '4v0fmnj1': {
      'ja': '検索',
      'en': '',
    },
    'y90zwb10': {
      'ja': '名詞',
      'en': '',
    },
    'veijrre4': {
      'ja': '代名詞',
      'en': '',
    },
    'zchtkpue': {
      'ja': '数詞',
      'en': '',
    },
    'e18ipv21': {
      'ja': '冠形詞',
      'en': '',
    },
    'oeo1mot7': {
      'ja': '副詞',
      'en': '',
    },
    'q07tshga': {
      'ja': '助詞',
      'en': '',
    },
    'f4x2ehx5': {
      'ja': '感嘆詞',
      'en': '',
    },
    'mrdg3gv6': {
      'ja': '動詞',
      'en': '',
    },
    '4ilm8rrf': {
      'ja': '形容詞',
      'en': '',
    },
    '0hchjri4': {
      'ja': '文法',
      'en': '',
    },
    'umo7cs00': {
      'ja': '編集',
      'en': '',
    },
    'qxuqhcvt': {
      'ja': 'Home',
      'en': '',
    },
  },
  // accountPage
  {
    '8w9cejbo': {
      'ja': 'メールアドレス',
      'en': '',
    },
    'qjwhnozm': {
      'ja': 'パスワード',
      'en': '',
    },
    '67wuxl0j': {
      'ja': '現在のパスワード',
      'en': '',
    },
    '0z35s15s': {
      'ja': '新しいパスワード',
      'en': '',
    },
    'b44z62ax': {
      'ja': '新しいパスワードをもう一度入力してください',
      'en': '',
    },
    '0plhwn93': {
      'ja': 'プレミアムプラン',
      'en': '',
    },
    'z9or9ktc': {
      'ja': 'AIによる例文作成機能',
      'en': '',
    },
    'hj8ivh8u': {
      'ja': '追加した単語に関連のある動画リコメンド',
      'en': '',
    },
    'xprqnnvw': {
      'ja': '¥980',
      'en': '',
    },
    '08bdq8x3': {
      'ja': '/月',
      'en': '',
    },
    'h3mb66z5': {
      'ja': 'プレミアムにアップグレード',
      'en': '',
    },
    'drlfp1kn': {
      'ja': 'アカウントを削除',
      'en': '',
    },
    'i9n1mc8n': {
      'ja': '設定',
      'en': '',
    },
  },
  // passwordReset
  {
    '391kdiv8': {
      'ja': 'メールアドレスを入力してください。パスワード再設定用のリンクをお送りします。',
      'en': '',
    },
    '3jgubm0j': {
      'ja': 'メールをご確認ください',
      'en': '',
    },
    '95j84iw1': {
      'ja': 'パスワード再設定用のリンクをメールアドレスにお送りしました。受信トレイを確認し、案内に従って手続きを行ってください。',
      'en': '',
    },
    'n2ar5oh9': {
      'ja': '追加',
      'en': '',
    },
  },
  // drawerMenu
  {
    'itaxjkyi': {
      'ja': 'アカウント',
      'en': '',
    },
    '95cyoskh': {
      'ja': 'お問い合わせ',
      'en': '',
    },
    'oa30ayjd': {
      'ja': 'ログアウト',
      'en': '',
    },
    'q4obfjvz': {
      'ja': '閉じる',
      'en': '',
    },
  },
  // addTagBottomSheet
  {
    'hqc1n507': {
      'ja': 'タグを追加',
      'en': '',
    },
    '951ws7wr': {
      'ja': '追加',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '8uzg24dd': {
      'ja': '',
      'en': '',
    },
    '1r0ot74t': {
      'ja': '',
      'en': '',
    },
    'kwd94gch': {
      'ja': '',
      'en': '',
    },
    'j8q3dfzn': {
      'ja': '',
      'en': '',
    },
    'jpwob2b0': {
      'ja': '',
      'en': '',
    },
    's1ie0cie': {
      'ja': '',
      'en': '',
    },
    '443vlnvn': {
      'ja': '',
      'en': '',
    },
    'xqkn8grn': {
      'ja': '',
      'en': '',
    },
    'k20a06rd': {
      'ja': '',
      'en': '',
    },
    'hh6qgxs6': {
      'ja': '',
      'en': '',
    },
    'yenqzhzx': {
      'ja': '',
      'en': '',
    },
    'aise73jo': {
      'ja': '',
      'en': '',
    },
    '83xmevw1': {
      'ja': '',
      'en': '',
    },
    'bb09nixy': {
      'ja': '',
      'en': '',
    },
    '2oe227rz': {
      'ja': '',
      'en': '',
    },
    'e6l65sye': {
      'ja': '',
      'en': '',
    },
    '026gqt06': {
      'ja': '',
      'en': '',
    },
    'lk7nfp3m': {
      'ja': '',
      'en': '',
    },
    'jpmso5y9': {
      'ja': '',
      'en': '',
    },
    'dkmpqiyg': {
      'ja': '',
      'en': '',
    },
    'qgjqo4xo': {
      'ja': '',
      'en': '',
    },
    'tz94ypl1': {
      'ja': '',
      'en': '',
    },
    'i4ofubgi': {
      'ja': '',
      'en': '',
    },
    '761xdtsd': {
      'ja': '',
      'en': '',
    },
    'aesbdchc': {
      'ja': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
