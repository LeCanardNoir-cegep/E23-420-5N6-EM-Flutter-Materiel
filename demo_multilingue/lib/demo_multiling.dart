import 'package:demo_multilingue/i18n/intl_localiztion.dart';
import 'package:flutter/material.dart';

class DemoMultiling extends StatefulWidget {

  @override
  State<DemoMultiling> createState() => _DemoMultilingState();
}

class _DemoMultilingState extends State<DemoMultiling> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(Locs.of(context).trans('TITLE')),
        ),
        body: Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(Locs.of(context).trans('MESSAGE')),
        )
    );
  }
}