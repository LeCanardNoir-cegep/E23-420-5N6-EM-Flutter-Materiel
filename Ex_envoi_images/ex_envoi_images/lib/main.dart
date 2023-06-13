import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'http_service.dart';

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
  List<File> pickedFilesList = [];
  HttpService httpService = HttpService();
  ImagePicker imgPicker = ImagePicker();
  List<String> imgUrlList =[];

  Future<void> _getManyImage() async{
    pickedFilesList.clear();
    List<XFile> xFileList = await imgPicker.pickMultiImage();
    if( xFileList.isNotEmpty ){
      for(XFile xFile in xFileList){
        pickedFilesList.add(File(xFile.path));
      }
    }
    xFileList.map((e) => print(e.name));
    setState(() {});
  }
  
  Future<void> _getImgUrlList()async {
    imgUrlList.clear();
    List<int> res = await httpService.postManyImage(pickedFilesList);
    //res.map((e) {imgUrlList.add("${httpService.dio.options.baseUrl}/file/$e");});
    for(int i in res){
      imgUrlList.add("${httpService.dio.options.baseUrl}/file/$i");
    }
    print(imgUrlList);
    setState(() {});
  }

  List<Image> _showImage(){
    return imgUrlList.map((e) => Image.network(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton.icon(
                onPressed: _getManyImage,
                icon: Icon(Icons.image_search),
                label: Text("Get image list")
            ),
            if( pickedFilesList.isNotEmpty ) ElevatedButton.icon(
              onPressed: _getImgUrlList,
              icon: Icon(Icons.send),
              label: Text("Send to server"),
            ),
            if(imgUrlList.isNotEmpty) Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: _showImage(),
              ),
            )
          ],
        ),
      )
    );
  }
}
