import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  String bkgAssetImg = "assets/images/ahsoka.jpg";
  XFile? bkgImgXFile;

  ImageProvider _getImg(){
    if(bkgImgXFile == null) {
      return AssetImage(bkgAssetImg);
    }else{
      return FileImage(File(bkgImgXFile!.path));
    }
  }

  Future<void> _changeBkgImg() async{
    ImagePicker imgPicker = ImagePicker();
    bkgImgXFile = await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: _getImg(),
              fit: BoxFit.cover
          )
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.white70,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          label: Text("Nom"),
                          labelStyle: Theme.of(context).textTheme.bodySmall
                      ),
                    ),TextField(
                      decoration: InputDecoration(
                          label: Text("Prenom"),
                          labelStyle: Theme.of(context).textTheme.bodySmall
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton.icon(
                        onPressed: _changeBkgImg,
                        icon: Icon(Icons.image),
                        label: Text("change image"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
