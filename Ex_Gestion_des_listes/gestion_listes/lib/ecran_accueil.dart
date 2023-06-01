import 'package:flutter/material.dart';
import 'package:gestion_listes/jolie_liste_lambda.dart';
import 'package:gestion_listes/ordre_alpha.dart';

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
        appBar: AppBar(
          title: Text("Accueil"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              nav.basicLink(OrdreAlpha(), "OrdreAlpha"),
              nav.basicLink(JolieListeLambda(), "JolieListeLambda"),
              //nav.routeLink('/ecranc' ,"Vers Ecran C" , "Hello C whit param"),
            ],
          ),
        )
    );
  }
}

class _NavButton{
  final BuildContext _context;
  _NavButton(this._context);

  OutlinedButton basicLink(Widget screen, String text){
    return OutlinedButton(
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

  OutlinedButton routeLink(String route, String text, String arg){
    return OutlinedButton(
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