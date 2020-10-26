import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'languageLocalizations.dart';

class LanguageLocalizationsDelegate
    extends LocalizationsDelegate<LanguageLocalizations> {
  const LanguageLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<LanguageLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<LanguageLocalizations>(
        LanguageLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<LanguageLocalizations> old) {
    // TODO: implement shouldReload
    // throw UnimplementedError();
    return false;
  }

  static LanguageLocalizationsDelegate delegate =
      const LanguageLocalizationsDelegate();
}
