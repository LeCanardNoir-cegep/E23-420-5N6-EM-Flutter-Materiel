import 'package:flutter/material.dart';
import 'package:navigation/ecran_a.dart';
import 'package:navigation/ecran_accueil.dart';

import 'ecran_c.dart';

class LeTiroir extends StatefulWidget {
  const LeTiroir({Key? key}) : super(key: key);

  @override
  State<LeTiroir> createState() => _LeTiroirState();
}

class _LeTiroirState extends State<LeTiroir> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: _GetListView(context).show(),
      ),
    );
  }
}

class _GetListView{
  final BuildContext _context;
  _GetListView(this._context);

  ListView show(){
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
            height: 200
        ),
        _ListTitleBuild(Icons.home, "Accueil", EcranAccueil()),
        _ListTitleBuild(Icons.abc, "Ecran A", EcranA()),
        //_ListTitleBuild(Icons.people, "Ecran C", EcranC()) // CAN'T HAVE PARAMETER
      ],
    );
  }
  ListTile _ListTitleBuild(IconData icon, String title, Widget screen){
    return ListTile(
        dense: true,
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          Navigator.of(_context).pop();
          Navigator.push(
              _context,
              MaterialPageRoute(
                  builder: (context) => screen
              )
          );
        },
      );
  }
}