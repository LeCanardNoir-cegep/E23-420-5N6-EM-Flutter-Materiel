import 'package:flutter/material.dart';
import 'package:redimentionnement/nav_drawer.dart';

class PageLowRes extends StatefulWidget {
  const PageLowRes({super.key, required this.title});

  final String title;

  @override
  State<PageLowRes> createState() => _PageLowResState();
}

class _PageLowResState extends State<PageLowRes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Placeholder(),
    );
  }
}
