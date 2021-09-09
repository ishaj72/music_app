import 'package:flutter/material.dart';
import 'package:rhythmic/homePage.dart';

class Splash extends StatefulWidget {
  //const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
   void initState() {
     // TODO: implement initState
     super.initState();
     Future.delayed(Duration(seconds: 4),(){
       Navigator.of(context).pushReplacementNamed("homePage");
     },
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
       body:
       Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Center(
             child: CircleAvatar(
               backgroundImage: AssetImage('assets/Rhythmic_gif.gif'),
               radius: 150,
             ),
           ),
         ],
       ),
     );
  }
}

