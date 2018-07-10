import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/utils.dart' as utils;
import 'package:cabinet/patients/image.dart';
import 'package:cabinet/patients/video.dart';
import 'package:cabinet/interface/choice.dart' as choice;
import '../dao/userDao.dart';

class ProfilPatient extends StatefulWidget {
  static const String routeName = '/profilpatient';
  @override
  State<StatefulWidget> createState() => ProfilPatientState();
}

class ProfilPatientState extends State<ProfilPatient> {
  final colorFinal = new Color.fromRGBO(3, 175, 340, 1.0);
  static const colorConst = const Color.fromRGBO(3, 175, 340, 1.0);

  Widget _body = StreamBuilder(
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
  );

  static Widget _buildListItem(
      BuildContext context, DocumentSnapshot document) {
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

  Widget _loadBody(Widget body) {
    setState(() {
      _body = body;
    });
    return _body;
  }

  _selected(choice.Choice choice) {
    if (choice.title == 'Photo') {
      _loadBody(image());
    } else {
      _loadBody(video());
    }
  }

  @override
  initState() {
    connectUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                choice.choices[0].icon,
                color: utils.colorWhite,
              ),
              onPressed: () {
                _selected(choice.choices[0]);
              },
            ),
            new IconButton(
              icon: new Icon(
                choice.choices[1].icon,
                color: utils.colorWhite,
              ),
              onPressed: () {
                _selected(choice.choices[1]);
              },
            ),
            new IconButton(
              icon: new Icon(
                Icons.menu,
                color: utils.colorWhite,
              ),
              onPressed: null,
            ),
          ],
          title: new Text('Mon profil'),
          backgroundColor: utils.colorGlobal,
        ),
        body: _loadBody(_body),
      ),
    );
  }
}
