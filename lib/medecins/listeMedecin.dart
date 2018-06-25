import 'dart:convert';

import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;

class ListeMedecin extends StatefulWidget {
  static const String routeName = '/listemedecin';
  final List listMedecin = ['un', 'deux'];

  @override
  State<StatefulWidget> createState() => ListeMedecinState();
}

class ListeMedecinState extends State<ListeMedecin> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Liste des médecins',
            style: utils.getMyStyle(),
          ),
          backgroundColor: utils.colorGlobal(),
        ),
        body: new Container(
          padding: const EdgeInsets.all(5.0),
          child: new Center(
            child: new FutureBuilder(
              future: DefaultAssetBundle
                  .of(context)
                  .loadString('assets/data/medecins.json'),
              builder: (context, snapshot) {
                // var medecins = snapshot.data.toString();
                var medecins = JSON.decode(snapshot.data.toString());
                return new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      margin: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: new CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: new AssetImage(
                                          'assets/images/medecin.png'),
                                    ),
                                  ),
                                  new Padding(padding: const EdgeInsets.all(5.0),
                                  ),
                                  new Text(
                                    medecins[index]['nom'],
                                    style: utils.getMyStyleGlobal(),
                                  ),
                                  new Text(medecins[index]['prenom']),
                                ],
                              ),
                              new Padding(padding: const EdgeInsets.all(3.0),),
                              new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text("Spécialité : " +
                                      medecins[index]['specialite']),
                                  new Text("Né(e) le : " +
                                      medecins[index]['dateNat']),
                                  new Padding(padding: new EdgeInsets.all(2.0)),
                                  new Text(
                                    'ADRESSE',
                                    style: utils.getMyStyleGlobal(),
                                  ),
                                  new Padding(padding: new EdgeInsets.all(2.0),),
                                  new Text(
                                    'CONTACT',
                                    style: utils.getMyStyleGlobal(),
                                  ),
                                  new Text("Téléphone : "),
                                  new Text(
                                      "Email : " + medecins[index]['email']),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: medecins == null ? 0 : medecins.length,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
