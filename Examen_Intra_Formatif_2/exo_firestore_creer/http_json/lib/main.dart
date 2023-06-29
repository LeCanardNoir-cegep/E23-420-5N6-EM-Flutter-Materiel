import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final dio = Dio(BaseOptions(
    baseUrl: "http://10.0.2.2:8080"
  ));

  TextEditingController txtCtrl = TextEditingController();
  String serverResponse = "standby";

  Future<void> _postdata() async {
    try{
      final response = await dio.post("/exos/error/or/not/",  data: {"nom" : txtCtrl.text });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.data)));
    }on DioException catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Non")));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: txtCtrl,
                decoration: InputDecoration(
                  labelText: "Nom"
                ),
              ),
              ElevatedButton(
                  onPressed: _postdata,
                  child: Text("Send that shit")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
