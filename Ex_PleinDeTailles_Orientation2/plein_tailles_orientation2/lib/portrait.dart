import 'package:flutter/material.dart';
import 'package:plein_tailles_orientation2/my_login.dart';

class PortraitScreen extends StatefulWidget {
  const PortraitScreen({super.key, required this.title});
  final String title;

  @override
  State<PortraitScreen> createState() => _PortraitScreenState();
}

class _PortraitScreenState extends State<PortraitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/elvis.jpg"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyLogin(sideMargin: 20,),
            ],
          ),
        )
    );
  }
}
