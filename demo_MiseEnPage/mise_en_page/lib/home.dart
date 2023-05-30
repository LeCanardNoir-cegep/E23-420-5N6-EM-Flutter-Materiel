import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo mise en page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    color: Colors.blue,
                    child:
                    const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("Je prends 2/3"),
                    ),
                ),
              ),
              Expanded(
                flex: 1,
                  child: MaterialButton(
                    color: Colors.green,
                    onPressed: () {  },
                    child: const Text("Super button"),
                  )
              )
            ],
          ),
          Container(
            height: 200,
            color: Colors.red,
            margin: const EdgeInsets.all(2),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Salut"),
                          SizedBox(height: 10),
                          Icon(Icons.start),
                          Text("Yo")
                        ],
                      )
                  ),
                  Expanded(
                    flex: 7,
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        color: Colors.amberAccent,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Spacer prend de "),
                              Spacer(),
                              Icon(Icons.star),
                              Spacer(),
                              Text("1' espace")
                            ],
                          ),
                      )
                  )
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(7),
            child: TextFormField(
              decoration: const InputDecoration(
                fillColor: Colors.blue,
                filled: false,
                labelText: "Indice pour utilisateur",
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  borderSide: BorderSide(color: Colors.redAccent, width: 6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  borderSide: BorderSide(color: Colors.blue, width: 3)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  borderSide: BorderSide(color: Colors.green, width: 2)
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}
