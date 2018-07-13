import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;
import '../main.dart';
import 'profilPatient.dart';

class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  _loadBody(int index) {
    switch (index) {
      case 1:
        Navigator.popAndPushNamed(context, ProfilPatient.routeName);
        // Navigator.of(context).pop();
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    _loadBody(0);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
        ProfilPatient.routeName: (context) => new ProfilPatient(),
      },
      theme: new ThemeData(primaryColor: utils.colorGlobal),
      home: new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
        ),
        drawer: new Drawer(
          elevation: 0.0,
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountEmail: new Text('Email'),
                accountName: new Text('Name'),
                otherAccountsPictures: <Widget>[
                  new CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              new ListTile(
                title: new Text(
                  'Mon profil',
                  style: utils.myStyleGlobal,
                ),
                trailing: new Icon(
                  Icons.person,
                  color: utils.colorGlobal,
                ),
                onTap: () => _loadBody(1),
              ),
              new Divider(),
              new ListTile(
                title: new Text(
                  'Mon médecin',
                  style: utils.myStyleGlobal,
                ),
                trailing: new Icon(
                  Icons.supervisor_account,
                  color: utils.colorGlobal,
                ),
              ),
              new Divider(),
              new ListTile(
                title: new Text(
                  'Mes rendez-vous',
                  style: utils.myStyleGlobal,
                ),
                trailing: new Icon(
                  Icons.assignment_ind,
                  color: utils.colorGlobal,
                ),
              ),
              new Divider(),
              new ListTile(
                title: new Text(
                  'Déconnexion',
                  style: utils.myStyleGlobal,
                ),
                trailing: new Icon(
                  Icons.exit_to_app,
                  color: utils.colorGlobal,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => AppCabinet()));
                },
              ),
              new Divider(),
            ],
          ),
        ),
        body: _loadBody(0),
      ),
    );
  }
}
