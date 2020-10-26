import 'dart:ui';

import 'package:flutter/material.dart';

class LanguageLocalizations {
  final Locale locale;
  LanguageLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'home': 'Home',
      'me': 'Me',
      'changeTheme': 'change theme',
      'changeLanguage': 'change language',
    },
    'zh': {
      'home': '首页',
      'me': '我的',
      'changeTheme': '切换主题',
      'changeLanguage': '切换语言',
    }
  };

  get home {
    return _localizedValues[locale.languageCode]['home'];
  }

  get me {
    return _localizedValues[locale.languageCode]['me'];
  }

  get changeTheme {
    return _localizedValues[locale.languageCode]['changeTheme'];
  }

  get changeLanguage {
    return _localizedValues[locale.languageCode]['changeLanguage'];
  }

  static LanguageLocalizations of(BuildContext context) {
    return Localizations.of(context, LanguageLocalizations);
  }
}
