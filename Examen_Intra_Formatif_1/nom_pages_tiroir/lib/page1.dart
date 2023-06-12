import 'package:flutter/material.dart';
import 'package:nom_pages_tiroir/tiroir_nav.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key, required this.title});

  final String title;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(widget.title),
        ),
        drawer: const TiroirNav(),
        body: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
          ? Column(
            mainAxisSize: MainAxisSize.max,
            children: _getContainer(),
          )
          : Row(
            mainAxisSize: MainAxisSize.max,
            children: _getContainer(),
          ),
        )
    );
  }
}

List<Widget> _getContainer(){
  return [
    Expanded(
      child: Container(
        color: Colors.deepPurple,
      ),
    ),
    Expanded(
      child: Container(
        color: Colors.deepOrange,
      ),
    )
  ];
}