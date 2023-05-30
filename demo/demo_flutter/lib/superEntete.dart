import 'package:flutter/material.dart';

class SuperEntete extends StatefulWidget {
  const SuperEntete({Key? key}) : super(key: key);

  @override
  State<SuperEntete> createState() => _SuperEnteteState();
}

class _SuperEnteteState extends State<SuperEntete> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Holy shit")
            ]
        ));
  }
}
