import 'package:flutter/material.dart';

class TiroirNav extends StatefulWidget {
  const TiroirNav({Key? key}) : super(key: key);

  @override
  State<TiroirNav> createState() => _TiroirNavState();
}

class _TiroirNavState extends State<TiroirNav> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      children: [Text("Bruno Pouliot")]
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Page1"),
            onTap: (){
              Navigator.pushNamed(context, "/page1");
            },
          ),
          ListTile(
            title: Text("Page2"),
            onTap: (){
              Navigator.pushNamed(context, "/page2");
            },
          )
        ],
      )
    );
  }
}
