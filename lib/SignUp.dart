import 'package:flutter/material.dart';
import 'package:rhythmic/Login.dart';

class SignUp extends StatelessWidget {
  //const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pushReplacementNamed("homePage");
            },
                icon: Icon(Icons.arrow_back_ios_new))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0,),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("SignUp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(height: 20,),
                  Text("Create an account",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Username"),
                  inputFile(label:"Email"),
                  inputFile(label: "Password",obsCureText: true),
                  inputFile(label: "Confirm Password",obsCureText: true),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 0,left: 0,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.red,),
                      top: BorderSide(color: Colors.red,),
                      left: BorderSide(color: Colors.red,),
                      right: BorderSide(color: Colors.red,),
                    )
                ),
                child: MaterialButton(
                  onPressed: () {} ,
                  minWidth: double.infinity,
                  height: 50,
                  color: Colors.red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.00,
                      color: Colors.white,
                    ),
                  ),
                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account",
                  style: TextStyle(
                    fontSize: 15,color: Colors.white,
                  ),
                  ),
                  Text(" Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.00,color: Colors.red,
                    ),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputFile({label,obsCureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 5,),
      TextField(
        obscureText: obsCureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0
              ,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,),
          ),
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}
