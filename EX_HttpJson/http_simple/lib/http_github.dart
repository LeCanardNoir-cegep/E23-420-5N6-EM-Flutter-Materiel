import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'repo.dart';

class HttpGitHub extends StatefulWidget {
  const HttpGitHub({Key? key}) : super(key: key);

  final String title = "Http GitHub";

  @override
  State<HttpGitHub> createState() => _HttpGitHubState();
}

class _HttpGitHubState extends State<HttpGitHub> {
  List<Repo> repos = [];
  String username = "";

  Future<void> _login(String name) async{
    try{
      Response res = await Dio().get("https://api.github.com/users/$name/repos");
      var listJson = res.data as List;
      repos = listJson.map((e) => Repo.fromJson(e)).toList();
      setState(() {});
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final usernameCtrl = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: usernameCtrl,
                          autofocus: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Username is missing";
                            }
                            return null;
                          },
                      ),
                      ElevatedButton.icon(
                          onPressed: () async {
                            if(_formKey.currentState!.validate()){
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context){
                                    return AlertDialog(
                                      title: Text("Loading..."),
                                    );
                                }
                            );
                            username = usernameCtrl.text;
                            await _login(usernameCtrl.text);
                            Navigator.pop(context);
                          }
                          },
                          icon: Icon(Icons.whatshot),
                          label: Text("Get that shit")
                      ),
                      Text("Username: $username"),
                      Text("Repo Nbr: ${repos.length}")
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      itemCount: repos.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: RichText(
                              text: TextSpan(
                                  text: "Name: ",
                                  style: Theme.of(context).textTheme.bodySmall,
                                  children: <TextSpan>[
                                    TextSpan(text: repos[index].name, style: Theme.of(context).textTheme.titleSmall),
                                  ]
                              )
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              text: "Private: ",
                              style: Theme.of(context).textTheme.bodySmall,
                              children: <TextSpan>[
                                TextSpan(text: repos[index].private.toString(), style: Theme.of(context).textTheme.titleSmall),
                              ]
                            )
                          )
                        );
                      }, separatorBuilder: (BuildContext context, int index) => Divider(),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
