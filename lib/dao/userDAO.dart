import 'package:http/http.dart' as http;
import 'dart:async';

Future<http.Response> getUsers() async {
  String urlUser = 'https://jsonplaceholder.typicode.com/posts';
  return await http.get(Uri.encodeFull(urlUser), headers: {"Accepte": "application/json"});
}
