import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var txtCtrl = TextEditingController();
  int _counter = 0;
  CollectionReference<Map<String, dynamic>> col = FirebaseFirestore.instance.collection("final-pouliot");

  
  Future<void> _sendThisShit() async {
    var result = await col.add({
      "nomDeFamille": "Pouliot",
      "contenu": txtCtrl.text
    });
    print("Doc id: ${result.id}");
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: txtCtrl,
              decoration: InputDecoration(
                labelText: "Contenu"
              ),
            ),
            ElevatedButton(
                onPressed: _sendThisShit,
                child: Text("Send that shit!")
            ),
            StreamBuilder(
                stream: col.snapshots(),
                builder: (context, snapshot) {
                  QuerySnapshot<Map<String, dynamic>> data = snapshot.data!;
                  return Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: data.size,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(data.docs[index].data()["contenu"]),
                        )
                    ),
                  );
                },
            )
          ],
        ),
      ),
    );
  }
}