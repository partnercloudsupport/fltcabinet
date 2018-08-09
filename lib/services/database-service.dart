import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../interface/user.dart';

class DatabaseService {
  static final DatabaseService _instance = new DatabaseService._internal();
  factory DatabaseService() => _instance;
  static Database _db;

  Future<Database> get db async {
    print('Verify database');
    print(_db == null ? 'Initialisation' : 'OK');
    if (_db != null) return _db;
    _db = await initDB();
    print('Finished to initialize database');
    return _db;
  }

  DatabaseService._internal() {
    print('Want to create database');
  }

  initDB() async {
    Directory documentDir = await getApplicationDocumentsDirectory();
    String path = join(documentDir.path, "MainDb.db");
    var ourDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDB;
  }

  void _onCreate(Database db, int version) async {
    print('Want to create table');
    await db.execute(
        "CREATE TABLE IF NOT EXISTS cabinet (id INTEGER PRIMARY KEY, login TEXT, password TEXT)");
    print('Table created');
  }

  Future<int> saveUser(User user) async {
    print(db);
    var dbClient = await db;
    int result = await dbClient.insert('cabinet', user.toMap());
    return result;
  }

  Future<List> getAllUsers() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM cabinet");
    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite
        .firstIntValue(await dbClient.rawQuery("SELECT COUNT(*) from cabinet"));
  }

  // Future<User> getUser(int ID) async {
  //   var dbClient = await db;
  //   var result =
  //       await dbClient.rawQuery("SELECT * FROM cabinet WHERE $columnID=$ID");
  //   return result.length == 0 ? null : new User.fromMap(result.first);
  // }

  // Future<int> deleteUser(int id) async {
  //   var dbClient = await db;
  //   return await dbClient
  //       .delete(tableUser, where: "$columnID = ?", whereArgs: [id]);
  // }

  // Future<int> updateUser(User user) async {
  //   var dbClient = await db;
  //   return await dbClient.update(tableUser, user.toMap(),
  //       where: "$columnID=?", whereArgs: [user.id]);
  // }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
