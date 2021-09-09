import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rhythmic/Login.dart';
import 'package:rhythmic/SignUp.dart';
import 'package:rhythmic/SplashScreen.dart';
import 'homePage.dart';
//import 'dart:async';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      routes: <String,WidgetBuilder>{
        "homePage":(BuildContext context)=>HomePage(),
        "Login":(BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),

      },
    );
  }
}

