import 'package:flutter/material.dart';
import 'package:navigation/ecran_a.dart';
import 'package:navigation/tiroir_nav.dart';

import 'ecran_b.dart';

class EcranAccueil extends StatefulWidget {
  const EcranAccueil({Key? key}) : super(key: key);

  @override
  State<EcranAccueil> createState() => _EcranAccueilState();
}

class _EcranAccueilState extends State<EcranAccueil> {
  @override
  Widget build(BuildContext context) {
    var nav = _NavButton(context);
    return Scaffold(
      drawer: LeTiroir(),
      appBar: AppBar(
        title: Text("Accueil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            nav.basicLink(EcranA(), "Vers Ecran A"),
            nav.basicLink(EcranB(le_parametre: 'Hello B whit param'), "Vers Ecran B"),
            nav.basicLink(EcranB(le_parametre: 'Fuck you B with other param'), "Vers Ecran B avec différente valeur du paramètre"),
            nav.routeLink('/ecranc' ,"Vers Ecran C" , "Hello C whit param"),
          ],
        ),
      )
    );
  }
}

class _NavButton{
  final BuildContext _context;
  _NavButton(this._context);

  MaterialButton basicLink(Widget screen, String text){
    return MaterialButton(
      onPressed: (){
        Navigator.push(
            _context,
            MaterialPageRoute(
                builder: (context) => screen
            )
        );
      },
      child: Text(text),
    );
  }

  MaterialButton routeLink(String route, String text, String arg){
    return MaterialButton(
      onPressed: (){
        Navigator.pushNamed(
            _context,
            route,
            arguments: arg
        );
      },
      child: Text(text),
    );
  }
}