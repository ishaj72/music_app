import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class ForgetPassword extends StatefulWidget {
  //const ({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  var user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();
    Navigator.pushReplacementNamed(context,"/");
    // final googleSignIn = GoogleSignIn();
    // final googleSignIn = GoogleSignIn();
    // await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
          elevation: 0,
        ),
        backgroundColor: Colors.orange.shade300,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height-250,
            width: MediaQuery.of(context).size.width-50,

            child: !isloggedin
                ?
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(),
                    height: 100.0,
                    width: 100.0,
                  ),
                ],
              ),
            ):
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40.0),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Hello ${user.displayName} you are Logged in as ${user.email}",
                          style:
                          TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                    onPressed: signOut,
                    child: Text('Signout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}


