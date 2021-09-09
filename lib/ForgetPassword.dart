import "package:flutter/material.dart";

class ForgetPassword extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

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
    );
  }
}


