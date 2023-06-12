import 'package:flutter/material.dart';

import 'tiroir_nav.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(widget.title),
      ),
      drawer: TiroirNav(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text("Entrez votre nom")
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: (){print("annuler");},
                      child: Text("Annuler"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blueAccent)
                      ),
                  ),
                ),
                SizedBox(width: 10,),

                Expanded(
                  child: ElevatedButton(
                      onPressed: (){print("Save");},
                      child: Text("Sauvegarder"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blueAccent)
                      )
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
