import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double pad = 16.0;


  @override
  Widget build(BuildContext context) {
    var txt = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(txt.appname),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(pad),
                  child: Text(txt.works),
                ),
              ),
              Spacer(),
              Container(
                color: Colors.green,
                child: Padding(
                  padding: EdgeInsets.all(pad),
                  child: Text(txt.yes),
                ),
              )
            ],
          ), ///TOP
          Expanded(
            child: Center(
              child: Text(txt.nobody),
            )
          ), /// Middle earth
          Center(
            child: Padding(
              padding: EdgeInsets.all(pad),
              child: Text(txt.toaster, style: Theme.of(context).textTheme.titleMedium,),
            ),
          )
        ],
      )
    );
  }
}
