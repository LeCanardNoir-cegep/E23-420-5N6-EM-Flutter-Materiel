import 'package:flutter/material.dart';
import 'package:navigation/ecran_a.dart';
import 'package:navigation/ecran_accueil.dart';
import 'package:navigation/ecran_b.dart';

import 'ecran_c.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Map<String, WidgetBuilder> routes(){
    return {
      '/ecrana' : (context) => EcranA(),
      '/ecranc' : (context) => EcranC(),
      '/accueil' : (context) => EcranAccueil()
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      darkTheme: ThemeData.dark(),
      home: EcranAccueil(),
      routes: routes(),
    );
  }
}
