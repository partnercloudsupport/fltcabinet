import 'package:flutter/material.dart';
import './general/accueil.dart';
import './general/inscription.dart';
import './general/seConnecter.dart';

import './patients/monProfil.dart';
import './patients/prendreRDV.dart';

import './medecins/listeMedecin.dart';

void main() => runApp(new AppCabinet());

class AppCabinet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new Accueil(), routes: <String, WidgetBuilder>{
      Accueil.routeName: (BuildContext context)=> new Accueil(),
      ListeMedecin.routeName: (BuildContext context) => new ListeMedecin(),
      MonProfil.routeName: (BuildContext context) => new MonProfil(),
      PrendreRDV.routeName: (BuildContext context) => new PrendreRDV(),
      SeConnecter.routeName: (BuildContext context) => new SeConnecter(),
      Inscription.routeName: (BuildContext context) => new Inscription(),
    });
  }
}
