import 'package:flutter/material.dart';

class PleinContrainer extends StatefulWidget {
  const PleinContrainer({Key? key}) : super(key: key);

  @override
  State<PleinContrainer> createState() => _PleinContrainerState();
}

class _PleinContrainerState extends State<PleinContrainer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 200,
            color: Colors.red,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: 200,
            color: Colors.green,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: 200,
            color: Colors.yellow,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 200,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            height: 200,
            color: Colors.redAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            height: 200,
            color: Colors.amber,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            height: 200,
            color: Colors.blueAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            height: 200,
            color: Colors.deepOrange,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35),
          child: Container(
            height: 200,
            color: Colors.indigoAccent,
          ),
        )
      ],
    );
  }
}
