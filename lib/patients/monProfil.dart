import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;

class MonProfil extends StatefulWidget {
  static const String routeName = '/monprofil';
  @override
  State<StatefulWidget> createState() => MonProfilState();
}

class MonProfilState extends State<MonProfil> {
  final colorFinal = new Color.fromRGBO(3, 175, 340, 1.0);
  static const colorConst = const Color.fromRGBO(3, 175, 340, 1.0);

  void _pushProfil() {}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: _pushProfil,
            )
          ],
          title: new Text('Mon profil'),
          backgroundColor: utils.colorGlobal(),
        ),
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text(
                'Bienvenu',
                style: utils.getMyStyleGlobal(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
