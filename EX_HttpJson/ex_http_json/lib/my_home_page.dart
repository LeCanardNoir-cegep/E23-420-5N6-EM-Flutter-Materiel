import 'package:ex_http_json/http_service.dart';
import 'package:flutter/material.dart';

import 'loader_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String simpleResponse = "";
  Map<String, dynamic> jsonResponse = {};

  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService(context, "https://api.ipfy.org/");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(simpleResponse),
            ElevatedButton.icon(
                onPressed: () async {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const LoaderDialog()
                  );
                  simpleResponse = await httpService.getStringData();
                  Navigator.pop(context);
                  setState(() {});
                },
                icon: const Icon(Icons.link),
                label: const Text("Simple data")
            ),
            Text( jsonResponse.isNotEmpty ? jsonResponse["ip"] : "null"),
            ElevatedButton.icon(
                onPressed: () async {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const LoaderDialog()
                  );
                  jsonResponse = (await httpService.getJsonData("format", "json"))!;
                  Navigator.pop(context);
                  setState(() {});
                },
                icon: const Icon(Icons.link),
                label: const Text("Json data")
            ),
          ],
        ),
      ),
    );
  }
}

