import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePageL10n extends StatefulWidget {

  @override
  State<MyHomePageL10n> createState() => _MyHomePageL10nState();
}

class _MyHomePageL10nState extends State<MyHomePageL10n> {

  @override
  Widget build(BuildContext context) {
    var currentLocale = Localizations.localeOf(context).toString();
    var txt = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(txt.appName),
        ),
        body: Column(
          children: [
            Text(txt.helloWorld),
            Text(txt.hello("burN@")),
            Localizations.override(
              context: context,
              locale: currentLocale == "ja" ? Locale('en') : Locale(currentLocale),
              child: Builder(builder: (
                  BuildContext context) => CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                onDateChanged: (value) {},
              )
              ),
            ),
          ],
        )
    );
  }
}
