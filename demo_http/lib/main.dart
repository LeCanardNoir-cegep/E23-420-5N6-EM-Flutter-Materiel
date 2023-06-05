import 'package:demo_http/http_service.dart';
import 'package:demo_http/loader_dialog.dart';
import 'package:demo_http/transfer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:change_case/change_case.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        //useMaterial3: true,
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

  String maResponse = "inconnu";

  Future<void> signup(String username, String password)async {
    SignupRequest req = SignupRequest();
    req.username = username;
    req.password = password;
    try{
      LoaderDialog(context);
      SignupResponse response = await HttpService().signup(req);
      Navigator.pop(context);

      maResponse = response.username;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success: $maResponse")));

    }on DioError catch(e){
      Navigator.pop(context);
      if( e.response != null ){
        String message = e.response!.data.toString().toSentenceCase();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $message")));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error: Check your network.")));
      }
    }catch(e){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error: Something really weird is going on with this app, throw your cell phone away. NOW!")));
    }
  }


  Future<void> signin(String username, String password)async {
    SigninRequest req = SigninRequest();
    req.username = username;
    req.password = password;
    try{
      LoaderDialog(context);
      SigninResponse response = await HttpService().signin(req);
      Navigator.pop(context);

      maResponse = response.username;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success: $maResponse")));

    }on DioError catch(e){
      Navigator.pop(context);
      if( e.response != null ){
        String message = e.response!.data.toString().toSentenceCase();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $message")));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error: Check your network.")));
      }
    }catch(e){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error: Something really weird is going on with this app, throw your cell phone away. NOW!")));
    }
  }
  
  Future<void> home() async{
    try{
      LoaderDialog(context);
      List<HomeResponse> response = await HttpService().home();
      Navigator.pop(context);
      if(response.isNotEmpty) print(response[0].toJson());
    }on DioError catch(e){
      Navigator.pop(context);
      if( e.response != null ){
        String message = e.response!.data.toString().toSentenceCase();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $message")));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error: Check your network.")));
      }
    }catch(e){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error: Something really weird is going on with this app, throw your cell phone away. NOW!")));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Ma response"),
            Text(maResponse,style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await signin("Bruno", "1234");
          //await signup("Bruno", "1234");
          await Future.delayed(Duration(seconds: 3));
          await home();
        },
        tooltip: 'getHttp',
        child: const Icon(Icons.add),
      ),
    );
  }
}
