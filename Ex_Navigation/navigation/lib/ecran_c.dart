import 'package:flutter/material.dart';

class EcranC extends StatefulWidget {
  const EcranC({Key? key}) : super(key: key);

  @override
  State<EcranC> createState() => _EcranCState();
}

class _EcranCState extends State<EcranC> {
  @override
  Widget build(BuildContext context) {
    final le_parametre = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ecran C"),
      ),
      body: Text("Ecran C: " + le_parametre),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
