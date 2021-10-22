import 'package:chatapp/Screens/Chat_app.dart';
import 'package:chatapp/Screens/Register.dart';
import 'package:chatapp/Screens/Sin_In.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/Welcome_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute:_auth.currentUser!=null? ChatApp.ChatApproute:WelcomScreen.welcomroute,
      routes: {
        WelcomScreen.welcomroute:(context)=>WelcomScreen(),
        SinIn.SinInroute:(context)=>SinIn(),
        Register.Registerroute:(context)=>Register(),
        ChatApp.ChatApproute:(context)=>ChatApp(),

      },
    );
  }
}
