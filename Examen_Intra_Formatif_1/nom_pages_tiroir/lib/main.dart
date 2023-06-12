import 'package:flutter/material.dart';
import 'package:nom_pages_tiroir/page1.dart';

import 'page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Map<String, WidgetBuilder> routes(){
    return {
      '/page1' : (context) => const Page1(title: 'Page 1'),
      '/page2' : (context) => const Page2(title: 'Page 2'),
    };
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const Page1(title: 'Page 1'),
      routes: routes(),
    );
  }
}