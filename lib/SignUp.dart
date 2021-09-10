import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rhythmic/Login.dart';
import 'package:string_validator/string_validator.dart';

class SignUp extends StatefulWidget {
  //const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _name, _email, _password,check;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("${check} and ${_password}");
      if(equals(check,_password)){
        try {
          UserCredential user = await _auth.createUserWithEmailAndPassword(
              email: _email, password: _password);
          if (user != null) {
            // UserUpdateInfo updateuser = UserUpdateInfo();
            // updateuser.displayName = _name;
            //  user.updateProfile(updateuser);
            await _auth.currentUser!.updateProfile(displayName: _name);
            // await Navigator.pushReplacementNamed(context,"/") ;

          }
        } catch (e) {
          showError(e.toString(),"error");
          print(e);
        }
      }
      else{
        showError("Password unmatched", "Incorrect");
      }
    }
  }
  showError(String errormessage,String val) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('${val}'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[Column(
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
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) {
                              return "Enter Username";
                            }
                          },
                          onSaved: (input) => _name = input!,
                          //obscureText: obsCureText,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) {
                              return "Enter Email";
                            }
                          },
                          onSaved: (input) => _email = input!,
                          //obscureText: obsCureText,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Password",
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
                              return "Enter password";
                            }
                          },
                          onSaved: (input) => _password = input!,
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
                              return "Enter password";
                            }
                          },
                          onSaved: (input) => check = input!,
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
                    )
                    // inputFile(label: "Username",onSave: _name),
                    // inputFile(label:"Email",onSave: _email),
                    // inputFile(label: "Password",obsCureText: true,onSave: _password),
                    // inputFile(label: "Confirm Password",obsCureText: true,onSave: check),
                  ],
                ),
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
                  onPressed:signUp ,
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
Widget inputFile({label,obsCureText = false,onSave}) {
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
      TextFormField(
        validator: (input) {
          if (input!.isEmpty) {
            return "Enter $label";
          }
        },
        onSaved: (input) => onSave = input!,
        obscureText: obsCureText,
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
  );
}
