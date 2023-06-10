import 'package:flutter/material.dart';

import 'my_login.dart';

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
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          title: Text(widget.title),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyLogin(sideMargin: 20,),
                ],
              ),
            ),
            Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage("assets/images/elvis.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
            )
          ],
        )
    );
  }
}
