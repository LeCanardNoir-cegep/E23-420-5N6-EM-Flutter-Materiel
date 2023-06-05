import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpGitHub extends StatefulWidget {
  const HttpGitHub({Key? key}) : super(key: key);

  final String title = "Http GitHub";

  @override
  State<HttpGitHub> createState() => _HttpGitHubState();
}

class _HttpGitHubState extends State<HttpGitHub> {
  String maReponse = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
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
                    Response res = await Dio().get("https://api.github.com/users/jorisdeguet/repos");
                    maReponse = res.data.toString();
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
