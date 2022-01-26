import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rhythmic/Page2.dart';
import 'package:rhythmic/SettingsPage.dart';
import 'package:rhythmic/search.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
        await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, "/");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  //final FirebaseAuth _auth = FirebaseAuth.instance;
  var user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("Login");
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
  @override
  void initState(){
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:Colors.black,
        elevation: 0,
        // title: Row(
        //   children: [
        //     IconButton(onPressed: (){
        //       Navigator.of(context).pushReplacementNamed("homePage");
        //     },
        //         color: Colors.red,
        //         icon: Icon(Icons.home_filled)),
        //   ],
        // ),
        actions: [IconButton(onPressed: () => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Smode()))
        },color: Colors.white, icon: Icon(Icons.search)),
          IconButton(
          color: Colors.red,
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingsPage(_auth,this.user)))
          }, icon: Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height+100,
          width: MediaQuery.of(context).size.width,
            child: Stack(

              //fit: StackFit.passthrough,
              children: <Widget>[
                Positioned(
                  // left: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Find the best music for your banger",style: TextStyle(color:Colors.white,fontSize:40 ),),
                  ),
                ),

                Positioned(
                  top: 130,left: 19,
                  child: GestureDetector(onTap: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2('K-Pop')))},
                    child: CircleAvatar(
                     radius: 70,
                     //backgroundColor: Colors.white,
                     backgroundImage: AssetImage('assets/pop.jpeg'),
                 ),
                  ),
               ),
                Positioned(
                  top :230,left:66,
                    child: Text("K-Pop",
                      style: TextStyle(
                          color: Colors.white,
                      fontSize: 20,fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                Positioned(
                  top: 130,left: 220,
                  child: GestureDetector(onTap: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2('Hindi Romantic')))},
                    child: CircleAvatar(
                      radius: 70,
                      //backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/roman.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  top :230,left:250,
                  child: Text("Romantic",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 310,left: 220,
                  child: GestureDetector(onTap: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2('Bollywood Party Hits')))},
                    child: CircleAvatar(
                      radius: 70,
                      //backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/party.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  top :410,left:270,
                  child: Text("Party",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 310,left: 19,
                  //child: GestureDetector(onTap: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2('K-Pop')))},
                    child: CircleAvatar(
                      radius: 70,
                      //backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/sad.jpg'),
                    ),
                 // ),
                ),
                Positioned(
                  top :410,left:73,
                  child: Text("Sad",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 500,left: 19,
                  child: GestureDetector(onTap: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2('Punjabi')))},
                    child: CircleAvatar(
                      radius: 70,
                      //backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/punjabi.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  top :610,left:57,
                  child: Text("Punjabi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 500,left: 220,
                  child: GestureDetector(onTap: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2('Tamil')))},
                    child: CircleAvatar(
                      radius: 70,
                      //backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/tamil.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  top :610,left:270,
                  child: Text("Tamil",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 680,left: 19,
                  child: GestureDetector(onTap: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2('Devotional')))},
                    child: CircleAvatar(
                      radius: 70,
                      //backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/devotion.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  top :780,left:28,
                  child: Text("Devotional",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 680,left: 220,
                  child: GestureDetector(onTap: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2('Chill')))},
                    child: CircleAvatar(
                      radius: 70,
                      //backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/chill.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  top :780,left:270,
                  child: Text("Chill",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //  Positioned(
                //   top: 850,left: 19,
                //   child: CircleAvatar(
                //     radius: 50,
                //     //backgroundColor: Colors.white,
                //     backgroundImage: AssetImage('assets/metal.jpeg'),
                //   ),
                // ),
                // Positioned(
                //   top :900,left:40,
                //   child: Text("Metal",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 25,fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // Positioned(
                //   top: 650,left: 270,
                //   child: CircleAvatar(
                //     radius: 50,
                //     //backgroundColor: Colors.white,
                //     backgroundImage: AssetImage('assets/punk.jpg'),
                //   ),
                // ),
                // Positioned(
                //   top :750,left:290,
                //   child: Text("Punk",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 25,fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                 ]
                ),
          ),
      ),
         );
       }
      }
