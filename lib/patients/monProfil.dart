import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/utils.dart' as utils;

class MonProfil extends StatefulWidget {
  static const String routeName = '/monprofil';
  @override
  State<StatefulWidget> createState() => MonProfilState();
}

class MonProfilState extends State<MonProfil> {
  final colorFinal = new Color.fromRGBO(3, 175, 340, 1.0);
  static const colorConst = const Color.fromRGBO(3, 175, 340, 1.0);

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(document['login']),
          ),
        ],
      ),
      onTap: () {
        print('Méthode à remplacer');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: null,
            )
          ],
          title: new Text('Mon profil'),
          backgroundColor: utils.colorGlobal(),
        ),
        body: new StreamBuilder(
          stream: Firestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading data');
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          },
        ),
      ),
    );
  }
}
