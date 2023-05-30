import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexLapin = Random().nextInt(4);
  int _poufs = 0;
  int _flops = 0;

  void gererTape(int index){
    if(_indexLapin == index){
      _poufs ++;
    }else{
      _flops ++;
    }
    print(_indexLapin);
    if(index == _indexLapin){
      _indexLapin = Random().nextInt(4);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    var b0 = MaterialButton(
      onPressed: () {
        gererTape(0);
      },
      child: Text(_indexLapin == 0 ? 'Lapin' : 'Taupe'),
    );

    var b1 = MaterialButton(
      onPressed: () {
        gererTape(1);
      },
      child: Text(_indexLapin == 1 ? 'Lapin' : 'Taupe'),
    );

    var b2 = MaterialButton(
      onPressed: () {
        gererTape(2);
      },
      child: Text(_indexLapin == 2 ? 'Lapin' : 'Taupe'),
    );

    var b3 = MaterialButton(
      onPressed: () {
        gererTape(3);
      },
      child: Text(_indexLapin == 3 ? 'Lapin' : 'Taupe'),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Pafs: ' + _poufs.toString(), style: TextStyle(color: Colors.green)),
                Text("Flops: " + _flops.toString(), style: TextStyle(color: Colors.red))
              ],
            ),
            SizedBox(height: 30),
            Text("Kill the Rabbit", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b0,
                b1
              ],
            ),
            SizedBox(height: 30),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  b2,
                  b3
                ])
          ],
        ),
      ),
    );
  }
}