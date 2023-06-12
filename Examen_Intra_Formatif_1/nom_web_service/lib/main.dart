import 'package:flutter/material.dart';
import 'package:nom_web_service/http_service.dart';

import 'my_day.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyDay> dayList = [];
  final HttpService httpService = HttpService();

  Future<void> _getDay(String year, String month, String day) async {
    dayList = await httpService.getMyDay(year, month, day);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var yearCtrl = TextEditingController();
    var monthCtrl = TextEditingController();
    var dayCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: yearCtrl,
              decoration: InputDecoration(
                label: Text("Year")
              ),
            ),
            TextField(
              controller: monthCtrl,
              decoration: InputDecoration(
                  label: Text("month")
              ),
            ),
            TextField(
              controller: dayCtrl,
              decoration: InputDecoration(
                  label: Text("day")
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  print(dayList);
                    await _getDay(yearCtrl.text, monthCtrl.text, dayCtrl.text);
                },
                child: Text("Get Day")
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: dayList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(dayList[index].jourDeLaSemaine),
                      subtitle: Text("${dayList[index].jour}/${dayList[index].mois}/${dayList[index].annee}"),
                    );
                  },
              ),
            )
          ],
        ),
      )
    );
  }
}
