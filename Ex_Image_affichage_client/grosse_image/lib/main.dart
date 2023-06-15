import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var urlImg = List<String>.generate(20, (i) => "https://4n6.azurewebsites.net/exos/image?width=${Random().nextInt(512)}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: urlImg.length,
            itemBuilder: (context, index) => CachedNetworkImage(
                imageUrl: urlImg[index],
                progressIndicatorBuilder: (context, url, download) => SizedBox(height:200, child: Center(child: CircularProgressIndicator(value: download.progress,))),
                errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red,),
            ),
        )
      )
    );
  }
}
