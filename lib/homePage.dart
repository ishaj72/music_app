import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/rhythmic_pic.jpeg'),
                radius: 70,
              )
          ),
          Container(
            child: Text(
              "Let the music heal you!",
              style: TextStyle(
                color: Colors.red[600],
                fontSize: 25.00,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height:10.0,width:100.0),
          new SizedBox(
            width: 120.0,
            height: 50.0,
            // ignore: deprecated_member_use
            child: RaisedButton(
              child:  Text('Login',
                style:TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed("Login");
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          SizedBox(height:10.0,width:100.0),
          new SizedBox(
            width: 120.0,
            height: 50.0,
            child: RaisedButton(
              child: Text('Sign Up',
                style:TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed("SignUp");
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),),
            ),
          ),
        ],
      ),

    );
  }
}
