import 'package:flutter/cupertino.dart';

import 'intl_localiztion.dart';

class DemoDelegate extends LocalizationsDelegate<Locs>{
  const DemoDelegate();

  @override
  bool isSupported(Locale locale) => ['fr','en'].contains(locale.languageCode);

  @override
  Future<Locs> load(Locale locale) async {
    Locs localizations = Locs(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(DemoDelegate old) => false;

}
