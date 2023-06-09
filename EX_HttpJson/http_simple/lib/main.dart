import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_simple/http_github.dart';
import 'package:http_simple/http_simple.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Map<String, WidgetBuilder> routes(){
    return {
      '/http_simple' : (context) => HttpSimple(),
      '/http_github' : (context) => HttpGitHub(),
    };
  }
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EX: 3.2 - 4.1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routes(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String maReponse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/http_simple");
                }, 
                child: Text(HttpSimple().title)
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/http_github");
                },
                child: Text(HttpGitHub().title)
            )
          ],
        ),
      )
    );
  }
}
