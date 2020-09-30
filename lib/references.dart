import 'package:firebase_database/firebase_database.dart';

DatabaseReference createReference(String name) {
  return FirebaseDatabase.instance.reference().child(name);
}
