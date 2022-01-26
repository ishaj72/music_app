import 'package:flutter/material.dart';
import 'package:rhythmic/Accounts.dart';

class SettingsPage extends StatefulWidget {
  var _auth;
  dynamic user;
  SettingsPage(this._auth,this.user);

  @override
  _SettingsPageState createState() => _SettingsPageState(_auth,user);
}

class _SettingsPageState extends State<SettingsPage> {
  var _auth;
  dynamic user;
  _SettingsPageState(this._auth,this.user);
  signOut() async {
    _auth.signOut();
    Navigator.of(context).pushReplacementNamed("homePage");
    // final googleSignIn = GoogleSignIn();
    // await googleSignIn.signOut();
  }
  @override
  Widget build(BuildContext context) {
    // print(user.email);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Text("          Settings",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),),
    ),
      body: Column(
        children: <Widget>[
          TextButton(onPressed: ()=>{Navigator.of(context).pushNamed("MobileData")},
              child: Text("    Mobile data",style: TextStyle(color: Colors.white,
              fontSize: 26,fontWeight: FontWeight.bold),)
          ),
          SizedBox(height:20,width: 30,),
          TextButton(onPressed: ()=>{Navigator.of(context).pushNamed("Storage")},
              child: Text("Storage",style: TextStyle(color: Colors.white,
                  fontSize: 26,fontWeight: FontWeight.bold),)
          ),
          SizedBox(height:20,width: 30,),
          TextButton(onPressed: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Accounts(user)))},
              child: Text("Account",style: TextStyle(color: Colors.white,
                  fontSize: 26,fontWeight: FontWeight.bold),)
          ),
          SizedBox(height:20,width: 30,),
          TextButton(onPressed: ()=>signOut(),
              child: Text("Logout",style: TextStyle(color: Colors.white,
                  fontSize: 26,fontWeight: FontWeight.bold),)
          ),
        ],
       ),
    );
  }
}
