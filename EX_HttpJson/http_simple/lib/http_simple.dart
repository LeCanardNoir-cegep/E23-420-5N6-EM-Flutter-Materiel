
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpSimple extends StatefulWidget {
  const HttpSimple({super.key});

  final String title = "Http simple";

  @override
  State<HttpSimple> createState() => _HttpSimpleState();
}

class _HttpSimpleState extends State<HttpSimple> {

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
              Text(maReponse),
              ElevatedButton.icon(
                  onPressed: () async {
                    Response res = await Dio().get("http://10.0.2.2:8080/test");
                    maReponse = res.data;
                    setState(() {});
                  },
                  icon: Icon(Icons.whatshot),
                  label: Text("Get that shit")
              )
            ],
          ),
        )
    );
  }
}
