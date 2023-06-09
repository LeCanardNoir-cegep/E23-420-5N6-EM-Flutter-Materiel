import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plein_de_tailles/my_card.dart';
import 'package:plein_de_tailles/my_image.dart';

class LandscapeScreen extends StatefulWidget {
  const LandscapeScreen({super.key, required this.title});
  final String title;

  @override
  State<LandscapeScreen> createState() => _LandscapeScreenState();
}

class _LandscapeScreenState extends State<LandscapeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey[900],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex:2, child: MyCard()),
                  Expanded(child: MyImage())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
