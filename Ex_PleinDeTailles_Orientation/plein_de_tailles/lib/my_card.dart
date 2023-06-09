import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: const EdgeInsets.all(20.0),
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText("Mes artistes favoris - connexion", style: Theme.of(context).primaryTextTheme.titleLarge, textAlign: TextAlign.center, maxLines: 1,maxFontSize: 18, minFontSize: 10,),
              const SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        icon: Icon(Icons.person),
                        iconColor: Colors.white70,
                        labelText: "Nom utilisateur",
                        labelStyle: TextStyle(color: Colors.white54),
                      ),
                      controller: _usernameCtrl,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        icon: Icon(Icons.lock),
                        iconColor: Colors.white70,
                        labelText: "Mot de passe",
                        labelStyle: TextStyle(color: Colors.white54),
                      ),
                      controller: _passwordCtrl,
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        showAboutDialog(
                            context: context,
                            applicationIcon: const Icon(Icons.people),
                            applicationName: _usernameCtrl.text,
                            applicationVersion: _passwordCtrl.text
                        );
                      },
                      icon: const Icon(Icons.login),
                      label: const Text("Login"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                        foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white)
                      ),
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
