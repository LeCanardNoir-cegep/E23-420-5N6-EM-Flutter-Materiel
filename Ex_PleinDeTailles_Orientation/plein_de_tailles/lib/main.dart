import 'package:flutter/material.dart';
import 'package:plein_de_tailles/landscape_screen.dart';
import 'package:plein_de_tailles/portrait_screen.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue).copyWith(background: Colors.black),
        useMaterial3: true,
      ),
      home: OrientationBuilder( builder: (context, orientation)=> orientation == Orientation.portrait ? PortraitScreen(title: "Portrait") : LandscapeScreen(title: "Landscape"))
    );
  }
}