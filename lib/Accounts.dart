import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  var user1;
  Accounts(this.user1);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {

  @override
  Widget build(BuildContext context) {
    print(widget.user1.displayName);
    //var user1;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Row(
          children: [
            Text(" Accounts",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),)
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10,
              child: Text("Username",style: TextStyle(color: Colors.white,fontSize: 29),)
          ),
          Positioned(
            top: 50,
              child: Text(widget.user1.displayName,style: TextStyle(color: Colors.white,fontSize: 20),)
          ),
          Positioned(
              top: 100,
              child: Text("Account",style: TextStyle(color: Colors.white,fontSize: 29),)
          ),
          Positioned(
              top: 140,
              child: Text("Free",style: TextStyle(color: Colors.white,fontSize: 20),)
          ),
          Positioned(
              top: 200,
              child: Text("Email Id",style: TextStyle(color: Colors.white,fontSize: 29),)
          ),
          Positioned(
              top: 260,
              child: Text(widget.user1.email,style: TextStyle(color: Colors.white,fontSize: 20),)
          ),
          // Positioned(
          //     top: 240,
          //     child: Text(widget.user1.email,style: TextStyle(color: Colors.white,fontSize: 20),)
          // ),
        ],
      ),
    );
  }
}
