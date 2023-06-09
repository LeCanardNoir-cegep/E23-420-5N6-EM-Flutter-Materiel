import 'package:flutter/material.dart';
import 'package:plein_tailles_orientation2/landscape.dart';
import 'package:plein_tailles_orientation2/portrait.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
          background: Colors.grey[900],
          primary: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
              ? PortraitScreen(title:"Portrait")
              : LandscapeScreen(title: "Landscape",)
      )
    );
  }
}

