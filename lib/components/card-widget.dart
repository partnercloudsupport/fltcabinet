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
                  width: 105.0,
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new CircleAvatar(
                            backgroundImage: AssetImage(data['photo'])),
                        new Text('Dr. ${data['prenom']}'),
                        new Text(data['nom'],
                            style: Theme
                                .of(context)
                                .textTheme
                                .body1
                                .copyWith(fontWeight: FontWeight.bold))
                      ]))),
          new Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('${data['specialite']}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .body1
                            .copyWith(fontWeight: FontWeight.bold)),
                    new Text(
                        '${data['adresse']['numero']}, ${data['adresse']['rue']}\n${data['adresse']['codePostal']}\n${data['adresse']['ville'].toString().toUpperCase()}'),
                    new Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: new FlatButton(
                            onPressed: () {},
                            child: new Text('Réserver',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(color: Colors.white70)),
                            color: utils.colorGlobal)),
                  ])),
        ]));
  }
}
