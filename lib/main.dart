import 'package:flutter/material.dart';
import 'appCabinet.dart';
import 'interface/user.dart';
import 'services/database-service.dart';

void main() async {
  List<User> user;
  DatabaseService db = new DatabaseService();
  db.initDB();
  // int intuser = await db.saveUser(new User('login', 'login'));
  // print(intuser);
  user = await db.getAllUsers();
  runApp(new AppCabinet());
}
