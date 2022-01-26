import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
 var songurl;
 var imageurl;
 var name;
 var artist;

  AudioPage(this.name,this.artist,this.songurl,this.imageurl);

  @override
  _AudioPageState createState() => _AudioPageState(name,artist,songurl,imageurl);
}

class _AudioPageState extends State<AudioPage> with SingleTickerProviderStateMixin {
  var songurl;
  var imageurl;
  var name;
  var artist;
  _AudioPageState(this.name,this.artist,this.songurl,this.imageurl);
  var lengthl;
  late AnimationController iconcontroller;
  bool isanimated=false;
  bool showPlay=true;
  bool showpause=false;
  AssetsAudioPlayer player= AssetsAudioPlayer();
 
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // print(document);
  //
  //
  // }
  void fun()async{
    print("$songurl,$imageurl,$name,$artist");

    iconcontroller=AnimationController(vsync:this,duration: Duration(milliseconds: 1000));
    await player.open(Audio.network(songurl[0]),autoStart: false,showNotification: true);

  }
  void AnimateIcon(){
    setState(() {
      isanimated=!isanimated;
      //isanimated?iconcontroller.forward():iconcontroller.reverse();
      if(isanimated){
        iconcontroller.forward();
        player.play();

      }
      else{
        iconcontroller.reverse();
        player.pause();
        //isanimated=false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    fun();
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        child: Stack(
          children: [
            Positioned(
              top: 50,
                left: 8,
                child:Align(
                alignment: Alignment.topLeft,
                child:IconButton(onPressed: (){
                  player.dispose();
                  Navigator.of(context).pop();

                }, icon: Icon(
                    CupertinoIcons.back,size: 35,color:Colors.black
                ))
            ) ),
            Positioned(
                top: 54,
                left:52,
                child:Align(
                    alignment: Alignment.center,
                    child:Text(name,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),
                    )
                ) ),

                 Positioned(
                   top:90,
                   left: 50,
                   child: Align(
                     alignment: Alignment.topCenter,
                       child:Container(
                         width: MediaQuery.of(context).size.width-50,
                         child: Text("by  $artist",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,letterSpacing: 1.5),
                ),
                       )
            ),
                 ),
            Positioned(
              top:150,

              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black87,
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width,
                    height :100,),
                  Container(
                    width: 320,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          imageurl,


                        ),

                        fit: BoxFit.contain
                      ),

                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Image.network(
                      imageurl,
                      errorBuilder: (context, exception, stackTrace) {
                        return Image.asset("assets/pop.jpeg");
                      },
                    ),
                  ),
                  SizedBox(height: 50,),
                  // SizedBox(height: 30,),
                  //PositionSeekWidget(currentPosition: currentPosition, duration: duration, seekTo: seekTo),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                        player.seekBy(Duration(seconds: -10));
                      },
                          icon: Icon(CupertinoIcons.backward_end_alt,size: 30,color: Colors.white,)),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: (){
                          AnimateIcon();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: AnimatedIcon(
                            icon:AnimatedIcons.play_pause,
                            progress: iconcontroller,
                            size: 50,
                            color: Colors.red,

                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(onPressed: (){
                        player.seekBy(Duration(seconds: 10));
                      },
                          icon: Icon(CupertinoIcons.forward_end_alt,size: 30,color: Colors.white,)),
                    ],
                  ),
                // Widget slider() {
                //     return Slider(
                //     value: _position.inSeconds.toDouble(),
                //     min: 0.0,
                //      max: _duration.inSeconds.toDouble(),
                //      onChanged: (double value) {
                //      setState(() {
                //      seekToSecond(value.toInt());
                //      value = value;
                //         });});
                //         }

        ],
              ),
          ),
            ),]
        ),
      ),
    );
  }
}
