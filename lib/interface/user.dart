import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String login;
  final String passwd;
  final int idProfil;

  User({this.login, this.passwd, this.idProfil});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      passwd: json['passwd'],
      idProfil: json['idProfil'],
    );
  }
}

Future<User> getUsers() async {
  String urlUser = 'http://localhost:3000/users/1';
  // final response = await http.get(Uri.encodeFull(urlUser), headers: {"Accepte": "application/json"});
  final response = await http.get(urlUser);
  print(response.body);
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}
