import 'package:flutter/material.dart';

class MajSimple extends StatefulWidget {
  const MajSimple({Key? key}) : super(key: key);

  @override
  State<MajSimple> createState() => _MajSimpleState();
}

class _MajSimpleState extends State<MajSimple> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.red,
                //height: 200,
                margin: EdgeInsets.all(6),
              )
          ),
          const Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("yo", style: TextStyle(color: Colors.red))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                Expanded(
                  child: Container(
                      color: Colors.black

                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
