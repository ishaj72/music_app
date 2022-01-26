import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rhythmic/Audiopage.dart';

class Page21 extends StatefulWidget {
  //const Page2({Key? key}) : super(key: key);
  final String Search;
  Page21(this.Search);

  @override
  _Page21State createState() => _Page21State();
}

class _Page21State extends State<Page21> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        title: Row(
          children: [
            // IconButton(onPressed: (){
            //   Navigator.of(context).pushReplacementNamed("");
            // },
            //     color: Colors.white,
            //     icon: Icon(Icons.album_rounded)),
            Text("Songs",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),)
          ],

        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('items').where("Name",isEqualTo: widget.Search).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: snapshot.data!.docs.map((document) {
                return GestureDetector(
                  child: Container(
                    child: GestureDetector( onTap: ()=>{
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AudioPage(document['Name'],document['Artist'],document['songUrl'],document['imageUrl']))),
                    },
                      child: Container(
                        width: MediaQuery.of(context).size.width, height: 80,

                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.red.shade200,
                            //shadowColor: Colors.white,
                            elevation: 4,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 70,
                                  height: 50,
                                  child: Image.network(
                                    document['imageUrl'],
                                    errorBuilder: (context, exception, stackTrace) {
                                      return Image.asset("assets/pop.jpeg");
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(

                                      width: MediaQuery.of(context).size.width-130,
                                      child: Text(document['Name'],
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(color:Colors.black,fontSize:20,fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width-130,
                                      child: Text(document['Artist'],
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(color:Colors.black,fontSize: 12,fontWeight: FontWeight.w800),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ) ;
          }
      ),
    );
  }
}
