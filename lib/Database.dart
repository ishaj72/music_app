import 'package:firebase_database/firebase_database.dart';
import 'package:rhythmic/check.dart';


final database =FirebaseDatabase.instance.reference();


DatabaseReference savepost(Check check){
  //Check(name,email,mob);
  var id = database.child('Details/').push();
  id.set(check.toJson());
  return id;
}
