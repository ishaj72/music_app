
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhythmic/Page2.dart';
import 'package:rhythmic/search_Result.dart';

class Smode extends StatefulWidget {
  Smode({Key? key}) : super(key: key);

  @override
  _SmodeState createState() => _SmodeState();
}

class _SmodeState extends State<Smode> {


  var but = Icons.search_rounded;
  bool uploading = false, boli = false;
  // var _search;
  TextEditingController _controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Stack(
          children: [
            Positioned(
                top: 40,
                left: 5,
                child: IconButton(
                  iconSize: 35,
                  onPressed: () =>
                      Navigator.pop(context), // => CameraApp(cameras),
                  icon: Icon(
                    Icons.chevron_left_outlined,
                    color: Colors.white,
                  ),
                )),
            Positioned(
                top: 95,
                right: 10,
                child: IconButton(
                  iconSize: 25,
                  onPressed: () => setState(() {
                    if (but == Icons.clear_rounded) {

                      _controller.clear();
                    } else {

                    }
                  }), // => CameraApp(cameras),
                  icon: Icon(
                    but,
                    color: Colors.lightBlueAccent,
                  ),
                )),
            Positioned(
                top: 100,
                left: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(25),
                      border: Border.all(color: Colors.lightBlueAccent)),
                  child: TextField(
                    onSubmitted: (value) => {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(
                          builder: (context) => Page21(value)))
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: GoogleFonts.lato(
                          color: Colors.grey[300], fontSize: 16),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        size: 20,
                      ),
                    ),
                    onTap: () => setState(() {
                      but = Icons.clear_rounded;
                    }),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
