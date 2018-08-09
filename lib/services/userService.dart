import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../interface/user.dart';

var users;

Future<List> getUsers() async {
  String urlUser = 'https://jsonplaceholder.typicode.com/posts';
  var response = await http
      .get(Uri.encodeFull(urlUser), headers: {"Accepte": "application/json"});
  users = json.decode(response.body);
  print('========================> $users');
  return users;
}

// Verify if an user is sing in
bool verifyUser(String login, String passwd) {
  bool isFounded = false;
  if (login.trim().toLowerCase().toString() == 'njaka' &&
      passwd.trim().toLowerCase().toString() == 'mdp') return !isFounded;
  return isFounded;
}

bool isUser(String login, String passwd) {
  return (login.trim().toLowerCase().toString() == 'njaka' &&
          passwd.trim().toLowerCase().toString() == 'mdp')
      ? true
      : false;
}

List<User> listUser() {
  return List<User>.generate(
      10,
      (index) =>
          User('Identifiant $index', 'Mot de passe : $index'));
}

String onVerifyUser(String login, String passwd) {
  return isUser(login, passwd) ? '/profilpatient' : 'profilmedecin';
}

bool addUser(String login, String passwd, int idProfil) {
  // User user = new User(login, passwd, id: idProfil);
  User user;
  bool added = false;
  final DocumentReference _userRef =
      Firestore.instance.collection('users').document(login.toString());
  _userRef.setData(user.toJson()).whenComplete(() {
    added = true;
    print(added);
  }).catchError((err) {
    print(err);
  });
  return added;
}
