import 'package:flutter/material.dart';

class DrapeauItalien extends StatefulWidget {
  const DrapeauItalien({Key? key}) : super(key: key);

  @override
  State<DrapeauItalien> createState() => _DrapeauItalienState();
}

class _DrapeauItalienState extends State<DrapeauItalien> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
            child: Container(
              color: Colors.green,
            )
        ),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
            )
        ),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
            )
        )
      ],
    );
  }
}
