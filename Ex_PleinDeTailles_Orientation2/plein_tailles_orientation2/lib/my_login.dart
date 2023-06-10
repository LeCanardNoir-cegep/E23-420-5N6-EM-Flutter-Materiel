import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key, required this.sideMargin});
  final double sideMargin;

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(widget.sideMargin),
              child: Wrap(
                children: [
                  Text("Mes artistes favoris", style: TextStyle(
                      color: Colors.white,
                      fontSize: Theme.of(context).textTheme.titleLarge?.fontSize
                  ),
                  ),
                  TextField(
                    style: TextStyle(
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      label: Text("Username"),
                      icon: Icon(Icons.person),
                      iconColor: Colors.grey
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    decoration: InputDecoration(
                        label: Text("Password"),
                        icon: Icon(Icons.login),
                        iconColor: Colors.grey
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {print("What the heck!!!");},
                          icon: Icon(Icons.login),
                          label: Text("Login"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColor),
                          foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
