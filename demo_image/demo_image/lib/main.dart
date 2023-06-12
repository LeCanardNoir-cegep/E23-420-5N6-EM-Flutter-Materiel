import 'dart:io';

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
  String imgPath = "";
  XFile? imgFile;
  String imgUrl = "";
  late Dio _dio;

  Future<void> _getImage() async {
    ImagePicker imagePicker = ImagePicker();
    imgFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if(imgFile != null) {
      imgPath = imgFile!.path;
    }
    setState(() {});
  }

  Future<void> sendImage() async {
    print("Envoie la caliss d'image");
    FormData fData = FormData.fromMap(
      {"file": await MultipartFile.fromFile(imgPath)}
    );
    try{
      Response res = await _dio.post("/singleFile", data: fData);
      imgUrl = "${_dio.options.baseUrl}/singleFile/${res.data.toString()}";
      setState(() {});
    }on DioException catch(e){
      print(e.message);
    }
  }


  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(
        baseUrl: "http://10.0.2.2:8080"
    ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Utiliser une image de la galerie"),
              ElevatedButton.icon(
                  onPressed: _getImage,
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
                    onPressed: () async {
                      await sendImage();
                    },
                    icon: Icon(Icons.upload),
                    label: Text("Upload")
                  )
                  : Text("En attente d'image"),
            ],
          ),
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
