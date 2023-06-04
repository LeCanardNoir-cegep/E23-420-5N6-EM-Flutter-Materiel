import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Map? response;

  Future<Null> getData() async{
    try{
      Response<Map> res = await Dio().get("https://api.ipify.org?format=json");
      if(res.statusCode! > 199 && res.statusCode! < 300 ) response = res.data;
      setState(() {});
    }catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Erreur: ${e}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( response != null ? response!["ip"] : "null"),
              ElevatedButton.icon(
                  onPressed: getData,
                  icon: Icon(Icons.safety_check),
                  label: Text("test")),
            ],
          )),
    );
  }
}
