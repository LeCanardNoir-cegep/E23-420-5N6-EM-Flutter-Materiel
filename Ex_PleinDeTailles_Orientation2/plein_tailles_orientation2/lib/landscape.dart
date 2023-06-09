import 'package:flutter/material.dart';

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
        body: Placeholder()
    );
  }
}
