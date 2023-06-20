import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_demo/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

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
  int _counter = 0;

  void _incrementCounter() {
    /// FIRESTORE
    final db = FirebaseFirestore.instance;
    final user = <String,dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };
    db.collection("users").add(user).then((DocumentReference doc) => print("DocumentSnapshot added with ID: ${doc.id}"));
    setState(() {
      _counter++;
    });
  }

  /// FIREBSE_AUTH
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var response = await FirebaseAuth.instance.signInWithCredential(credential);
    setState(() {});
    return response;
  }


  @override
  void initState() {
    /// FIREBSE_AUTH
    FirebaseAuth.instance.authStateChanges()
        .listen((User? user){
          if(user == null){
            print("User is currently signed out!");
          }else{
            print("User is signed in! ${user.email!}");
          }
        });
    setState(() {});
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed: signInWithGoogle, child: Text("SignIn")),
            ElevatedButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                setState(() {});
              },
              child: Text("signout"),
            ),
            if(FirebaseAuth.instance.currentUser != null) ElevatedButton(
                onPressed: (){
                  var user = FirebaseAuth.instance.currentUser!;
                  // print(user.displayName);
                  // print(user.email);
                  // print(user.phoneNumber);
                  // print(user.metadata.creationTime);
                  print(user.toString());
                },
                child: Text("Get user info")
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
