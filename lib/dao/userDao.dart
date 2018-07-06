import 'package:firebase_database/firebase_database.dart';

void connectUser() {
  DatabaseReference _userRef = FirebaseDatabase.instance.reference().child('users');
  _userRef.once().then(
    (DataSnapshot snapshot){
      print('userDAO.dart');
      print(snapshot.value);
    }
  );
  _userRef.keepSynced(true);
}
