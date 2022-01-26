import 'package:flutter/material.dart';

class Storage extends StatefulWidget {
  const Storage({Key? key}) : super(key: key);

  @override
  _StorageState createState() => _StorageState();
}

class _StorageState extends State<Storage> {
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
                   icon: Icon(Icons.sd_storage_outlined)),
                   Text(" Storage",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),)
            ],
          ),
        ),
      body: Stack(
        children: [
          Positioned(
            top:40,
              child: Text("Total storage used by app",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26) ,)
          ),
          Positioned(
              top:40,right: 10,
              child: Text("20 MB",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20) ,)
          ),
        ],
      ),
    );
  }
}
