// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
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
  return (login.trim().toLowerCase().toString() == 'njaka' && passwd.trim().toLowerCase().toString() == 'mdp') ? true : false;
 }

List<User> listUser() {
  return List<User>.generate(
    10,
    (index) => User(login: 'Identifiant $index', passwd: 'Mot de passe : $index', idProfil: index),
  );
}

String onVerifyUser(String login, String passwd) {
  return isUser(login, passwd) ? '/profilpatient' : 'profilmedecin';
}