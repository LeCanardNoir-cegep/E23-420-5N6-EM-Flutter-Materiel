import 'package:flutter/material.dart';

class MajSimple2 extends StatelessWidget {
  const MajSimple2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.0,
          child: Row(mainAxisSize: MainAxisSize.max, children: [
            Expanded(
                flex: 4,
                child: Container(
                  color: Colors.red,
                )),
            const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex:1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("yo", style: TextStyle(color: Colors.red, fontSize: 24)),
                            ],
                          )
                      ),
                      Spacer()
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Spacer(),
                    Expanded(
                        child: Container(
                      color: Colors.black,
                    ))
                  ],
                ))
          ]),
        ),
        Spacer(),
        MaterialButton(
          color: Theme.of(context).primaryColor,
          minWidth:  double.infinity,
          onPressed: (){},
          child: Text("Tabarnak", style: TextStyle(color: Colors.white, fontSize: 20),),
        )
      ],
    );
  }
}
