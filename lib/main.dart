import 'package:flutter/material.dart';

import './dao/tempPage.dart';
import './general/inscription.dart';
import './general/seConnecter.dart';

import './medecins/listeMedecin.dart';
import './medecins/profilMedecin.dart';

import './patients/profilPatient.dart';
import './patients/prendreRDV.dart';

import './utils/utils.dart' as utils;

import './users/listUser.dart';


void main() => runApp(new AppCabinet());

class AppCabinet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cabinet',
      routes: <String, WidgetBuilder>{
        Inscription.routeName: (BuildContext context) => new Inscription(),
        ListUser.rootName: (BuildContext context) => new ListUser(),
        ListeMedecin.routeName: (BuildContext context) => new ListeMedecin(),
        PrendreRDV.routeName: (BuildContext context) => new PrendreRDV(),
        ProfilPatient.routeName: (BuildContext context) => new ProfilPatient(),
        ProfilMedecin.routeNate: (BuildContext context) => new ProfilMedecin(),
        SeConnecter.routeName: (BuildContext context) => new SeConnecter(),
        TempPage.routeName:(BuildContext context) => new TempPage(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('CABINET'),
          backgroundColor: utils.getColorGlobal(),
          elevation: 0.0,
        ),
        body: Center(
          // child: SeConnecter(),
          child: SeConnecter(),
        ),
      ),
    );
  }
}
