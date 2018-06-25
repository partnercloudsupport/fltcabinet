import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;

class Inscription extends StatefulWidget {
  static const String routeName = '/inscription';

  @override
  State<StatefulWidget> createState() {
    return InscriptionState();
  }
}

class InscriptionState extends State<StatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          // title: Text('INSCRIPTION',),
          backgroundColor: utils.colorGlobal(),
        ),
        body: new Row(
          children: <Widget>[
            new Text('INCRIVEZ VOUS'),
          ],
        ),
      ),
    );
  }
}
