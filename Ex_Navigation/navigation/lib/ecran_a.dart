import 'package:flutter/material.dart';
import 'package:navigation/tiroir_nav.dart';

class EcranA extends StatefulWidget {
  const EcranA({Key? key}) : super(key: key);

  @override
  State<EcranA> createState() => _EcranAState();
}

class _EcranAState extends State<EcranA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeTiroir(),
      appBar: AppBar(
        title: const Text("Ecran A"),
      ),
      body: const Center(
          child: Text(
            'Ecran A',
            style: TextStyle(fontSize: 32.0, color: Colors.red),
          )
      ),
    );
  }
}
