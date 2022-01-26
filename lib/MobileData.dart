import 'package:flutter/material.dart';

class MobileData extends StatefulWidget {
  const MobileData({Key? key}) : super(key: key);

  @override
  _MobileDataState createState() => _MobileDataState();
}

class _MobileDataState extends State<MobileData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Row(
        children: [
        IconButton(onPressed: (){
      Navigator.of(context).pop();
    },
    color: Colors.white,
          icon: Icon(Icons.mobile_friendly)),
          Text(" Mobile Data",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),)
          ],
          ),
        ),
      body: Stack(
        children:[
          Positioned(
            top: 60,
            left: 10,
            child:Text("Your mobile data used this month",style: TextStyle(color: Colors.white,fontSize: 25),),
          ),
          Positioned(
            top: 100,
            left: 10,
            child:Text(">>10 Mb/3 Gb",style: TextStyle(color: Colors.white,fontSize: 20),),
          )
        ],

      ),
      );
    }
  }
