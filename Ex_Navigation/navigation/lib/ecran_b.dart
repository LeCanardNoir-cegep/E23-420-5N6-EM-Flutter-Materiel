import 'package:flutter/material.dart';
import 'package:navigation/tiroir_nav.dart';

class EcranB extends StatefulWidget {
  final String le_parametre;
  const EcranB({Key? key, required this.le_parametre}) : super(key: key);

  @override
  State<EcranB> createState() => _EcranBState();
}

class _EcranBState extends State<EcranB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LeTiroir(),
      appBar: AppBar(
        title: Text("Ecran B"),
      ),
      body: Text(
        'Ecran B: ' + widget.le_parametre,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
