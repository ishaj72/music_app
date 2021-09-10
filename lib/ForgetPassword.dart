import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password, _npassword;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      try {
        await _auth.signInWithEmailAndPassword(
            email: _password, password: _npassword);
      } catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('ERROR'),
                content: Text(e.toString()),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              );
            });
        print(e);
      }
    }
    else {
      print("hello");
    }
  }

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
              Navigator.of(context).pushReplacementNamed("homePage");
            },
                icon: Icon(Icons.arrow_back_ios_new))
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
              children: <Widget>[
                Text("Reset Password",
                style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                  ),
                 ),
                ],
               ),
              SizedBox(height: 70,),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40,),
                child: Form(
                  key: _formKey,
                child: Column(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget> [
                        Text("Enter new Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                            color: Colors.white),),
                      SizedBox(height: 5,),
                      TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return "Enter password";
                          }
                        },
                        onSaved: (input) => _password = input!,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 3
                                , horizontal: 5),
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
                        SizedBox(height: 10,),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                          validator: (input) {
                            if (input!.length<6) {
                              return "Enter Password";
                            }
                          },
                          onSaved: (input) => _npassword = input!,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0
                                , horizontal: 10),
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
                    ),
                  ],
                ),
                ),
              ),
             ],

            ),
           ),


            Padding(padding:
            EdgeInsets.symmetric(horizontal: 30,),
              child:Container(
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
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("Login");
                  } ,
                  minWidth: double.infinity,
                  height: 50,
                  color: Colors.red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Set Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20.00,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );

  }
}
