import 'package:flutter/material.dart';
import 'package:redimentionnement/nav_drawer.dart';

import 'my_image.dart';

class PageMedRes extends StatefulWidget {
  const PageMedRes({super.key, required this.title});

  final String title;

  @override
  State<PageMedRes> createState() => _PageMedResState();
}

class _PageMedResState extends State<PageMedRes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: MyImage.get(512, BoxFit.cover)
    );
  }
}
