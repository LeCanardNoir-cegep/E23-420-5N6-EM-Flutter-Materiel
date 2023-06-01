import 'package:flutter/material.dart';
import 'package:gestion_listes/ecran_accueil.dart';
import 'package:gestion_listes/jolie_liste_lambda.dart';
import 'package:gestion_listes/ordre_alpha.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Map<String, WidgetBuilder> routes(){
    return {
      '/Jolie_liste_lambda' : (context) => JolieListeLambda(),
      '/ordre_alpha' : (context) => OrdreAlpha(),
    };
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
    ),
      darkTheme: ThemeData.dark(),
      home: EcranAccueil(),
      routes: routes(),
    );
  }
}