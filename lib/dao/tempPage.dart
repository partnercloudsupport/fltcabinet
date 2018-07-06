import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../interface/user.dart';

Future<void> main() async {
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',//cabinet-8dd74
    options: const FirebaseOptions(
      databaseURL: 'https://cabinet-8dd74.firebaseio.com',
      apiKey: 'AIzaSyBxtWzIQtIsYexqOw9hlKZq-TbDT-gaQbY',
      googleAppID: '1:577939527966:android:e3a7d1641ebf8ef4',
    ),
  );
  runApp(TempPage(app: app));
}

class TempPage extends StatefulWidget {
  TempPage({this.app});
  final FirebaseApp app;
  static const routeName = '/temppage';
  @override
  _TempPageState createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  DatabaseReference userRef;
  User user;
  @override
  void initState() {
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    userRef = database.reference().child('users');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temp page',
      home: new Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FirebaseAnimatedList(
                query: userRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                  return ListTile(
                    leading: Icon(Icons.message),
                    title: Text(snapshot.value.toString()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
