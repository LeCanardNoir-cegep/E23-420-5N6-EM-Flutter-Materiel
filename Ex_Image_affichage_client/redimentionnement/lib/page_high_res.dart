import 'package:flutter/material.dart';
import 'package:redimentionnement/nav_drawer.dart';

import 'my_image.dart';

class PageHighRes extends StatefulWidget {
  const PageHighRes({super.key, required this.title});

  final String title;

  @override
  State<PageHighRes> createState() => _PageHighResState();
}

class _PageHighResState extends State<PageHighRes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: MyImage.get(null, BoxFit.cover)
    );
  }
}
