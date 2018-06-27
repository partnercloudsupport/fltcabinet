import 'package:flutter/material.dart';
import 'package:cabinet/general/inscription.dart';
// import './general/photo.dart';
import 'package:cabinet/general/seConnecter.dart';
// import './general/accueil.dart';
import 'package:cabinet/patients/monProfil.dart';
import 'package:cabinet/patients/prendreRDV.dart';
import 'package:cabinet/medecins/listeMedecin.dart';
import 'package:cabinet/users/authentifyGoogle.dart';

void main() => runApp(new AppCabinet());

class AppCabinet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        // home: new Accueil(),
        home: new AuthetifyGoogle(),
        routes: <String, WidgetBuilder>{
          ListeMedecin.routeName: (BuildContext context) => new ListeMedecin(),
          MonProfil.routeName: (BuildContext context) => new MonProfil(),
          PrendreRDV.routeName: (BuildContext context) => new PrendreRDV(),
          SeConnecter.routeName: (BuildContext context) => new SeConnecter(),
          Inscription.routeName: (BuildContext context) => new Inscription(),
        });
  }
}
