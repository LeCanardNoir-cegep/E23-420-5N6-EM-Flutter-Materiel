import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class OrdreAlpha extends StatefulWidget {

  @override
  State<OrdreAlpha> createState() => _OrdreAlphaState();
}

class _OrdreAlphaState extends State<OrdreAlpha> {

  List<String> name = [];


  @override
  void initState() {
    name = ["Juno", "Dumbo", "Pino", "DickHead", "Fliper"];
    name.sort();
  }

  void melangeNameList(){
    name.shuffle();
    setState(() {});
  }

  void nameGoUp(int index){
    if(index > 0){
      var item = name[index];
      var tmp = name[index - 1];
      name[index - 1] = item;
      name[index] = tmp;
    }
    setState(() {});
  }
  void nameGoDown(int index){
    if(index < name.length - 1){
      var item = name[index];
      var tmp = name[index + 1];
      name[index + 1] = item;
      name[index] = tmp;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OrdreAlpha"),
        ),
        body: Center(
          child: ListView(
            children: name.map((e) {
              var index = name.indexOf(e);
              return ListTile(
                dense: true,
                leading: Icon(Icons.person),
                title: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: Text(e)),
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if(index != 0) SizedBox(
                                width: 24,
                                child: IconButton(
                                  color: Colors.green,
                                  icon: Icon(Icons.arrow_upward),
                                  onPressed: () => nameGoUp(index),
                                ),
                              ),
                              if(index < name.length -1) SizedBox(
                                width: 24,
                                child: IconButton(
                                  color: Colors.red,
                                  icon: Icon(Icons.arrow_downward),
                                  onPressed: () => nameGoDown(index),
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                //subtitle: Text("Un caliss de soutitre inutile juste pour me faire chier!!!!"),
                onTap: () {
                    if(name.isSorted()){
                      melangeNameList();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$e mélange les cartes,... Oups!!!"),
                          duration: Duration(milliseconds: 2000)
                        ));
                    }
                },
              );
            }).toList(),
          ),
        )
    );
  }
}
