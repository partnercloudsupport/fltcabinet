import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/utils.dart' as utils;

class CardWidget extends StatelessWidget {
  final dynamic data;

  CardWidget({this.data});

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          new Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: new Container(
                  width: 100.0,
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new CircleAvatar(
                            backgroundImage: AssetImage(data['photo'])),
                        new Text(data['prenom']),
                        new Text(data['nom'],
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]))),
          new Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Text('${data['prenom']}'),
                    new Text('${data['specialite']}'),
                    new Text(
                        'Adresse\n${data['adresse']['numero']}, ${data['adresse']['rue']}'),
                    new FlatButton(
                        onPressed: () {},
                        child: new Text('Réserver', style: utils.myStyle),
                        color: utils.colorGlobal),
                  ])),
        ]));
  }
}
