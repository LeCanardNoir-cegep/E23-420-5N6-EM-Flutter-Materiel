import 'dart:io';

import 'package:demo_image/http_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

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
      home: const MyHomePage(title: 'Flutter: Gestion d\'image'),
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
  static HttpService httpService = HttpService();

  String imgPath = "";
  XFile? imgFile;
  String imgUrl = "";

  String apiImgPath = "";
  XFile? apiImgFile;
  String apiImgUrl = "";
  String? user= "";

  Future<void> _getGalerieImage() async {
    ImagePicker imagePicker = ImagePicker();
    imgFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if(imgFile != null) {
      imgPath = imgFile!.path;
    }
    setState(() {});
  }

  Future<void> _getApiGalerieImage() async {
    ImagePicker imagePicker = ImagePicker();
    apiImgFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if(imgFile != null) {
      apiImgPath = apiImgFile!.path;
    }
    setState(() {});
  }

  Future<void> _sendSingleFileImage() async {
    imgUrl = (await httpService.sendSingleFileImage(imgPath))!;
    setState(() {});
  }

  Future<void> _signup() async {
    user = await httpService.signin();
    setState(() {});
  }

  Future<void> _sendApiSingleFileImage() async {
    apiImgUrl = (await httpService.sendApiSingleFileImage(apiImgPath))!;
    setState(() {});
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Single File"),
                  ElevatedButton.icon(
                      onPressed: _getGalerieImage,
                      icon: Icon(Icons.image),
                      label: Text("selectionner image")
                  ),
                  Container(
                    child: (imgPath == "")
                        ? Text("Aucune image")
                        : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(child: Image.file(File(imgPath), fit: BoxFit.cover,)),
                              SizedBox(width: 20,),
                              Expanded(child: (imgUrl != "") ? Image.network(imgUrl): Text("pas d'image")),
                            ],
                          ),
                        )
                  ),
                  (imgPath != "")
                      ? ElevatedButton.icon(
                        onPressed: _sendSingleFileImage,
                        icon: Icon(Icons.upload),
                        label: Text("Upload")
                      )
                      : Text("En attente d'image"),
                ],
              ), /// SINGLE FILE
              Divider(height: 50,),
              Column(
                children: [
                  Text("Api Single File: $user"),
                  ElevatedButton.icon(
                      onPressed: _signup,
                      icon: Icon(Icons.image),
                      label: Text("Signup")
                  ),
                  ElevatedButton.icon(
                      onPressed: _getApiGalerieImage,
                      icon: Icon(Icons.image),
                      label: Text("selectionner image")
                  ),
                  Container(
                      child: (apiImgPath == "")
                          ? Text("Aucune image")
                          : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(child: Image.file(File(apiImgPath), fit: BoxFit.cover,)),
                            SizedBox(width: 20,),
                            Expanded(child:
                                  (apiImgUrl != "")
                                  ? Image.network(
                                    apiImgUrl,
                                    headers: httpService.cookie,
                                  )
                                  : Text("pas d'image")
                            ),
                          ],
                        ),
                      )
                  ),
                  (imgPath != "")
                      ? ElevatedButton.icon(
                      onPressed: _sendApiSingleFileImage,
                      icon: Icon(Icons.upload),
                      label: Text("Upload")
                  )
                      : Text("En attente d'image"),
                ],
              ), /// API SINGLE FILE
            ],
          ),
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
