import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  //const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _email, _password;
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
            email: _email, password: _password);
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.00,),
                    Text("Login into your account",
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red,),),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40,),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
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
                                  return "Enter Password";
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
                          children:<Widget> [
                            TextButton(onPressed: (){
                              Navigator.pushReplacementNamed(context, "ForgetPassword");
                            },
                                child: Text("Forget Password?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                ),
                            ),
                            ),
                          ],
                         ),
                        //inputFile(label: "Email",onSave: _email),
                        //inputFile(label: "Password",obsCureText: true,onSave: _password),
                      ],
                    ),
                  ),
                ),
                 Padding(padding:
                 EdgeInsets.symmetric(horizontal: 40,),
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
                       login();
                     } ,
                     minWidth: double.infinity,
                     height: 50,
                     color: Colors.red,
                     elevation: 0,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(50),
                     ),
                     child: Text(
                       "Login",
                       style: TextStyle(
                         fontWeight: FontWeight.w400,
                         fontSize: 20.00,
                         color: Colors.white,
                       ),
                     ),
                   ),
                 ),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an Account?",
                    style: TextStyle(
                      fontSize: 15,color: Colors.white,
                    ),
                    ),
                    Text(" SignUp",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.00,color: Colors.red,
                    ),),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

// Widget inputFile({label,obsCureText = false,onSave})
// {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.w800,
//           color: Colors.white,
//         ),
//       ),
//       SizedBox(height: 5,),
//       TextFormField(
//         validator: (input)
//         {
//           if(input!.isEmpty){
//             return "Enter $label";
//           }
//         },
//         onSaved: (input)=>onSave=input!,
//         obscureText: obsCureText,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0
//               ,horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.white,
//             ),
//           ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white,),
//           ),
//         ),
//       ),
//       SizedBox(height: 10,)
//     ],
//   );
// }