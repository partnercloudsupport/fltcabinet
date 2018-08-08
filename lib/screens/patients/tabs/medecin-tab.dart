import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

class MedecinTab extends StatefulWidget {
  @override
  _MedecinTabState createState() {
    return _MedecinTabState();
  }
}

class _MedecinTabState extends State<MedecinTab> {
  Future<dynamic> future;

  @override
  void initState() {
    super.initState();
    // future = DefaultAssetBundle.of(context).loadString('assets/data/medecins.json');
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.transparent,
      child: new RefreshIndicator(
        onRefresh: () => _onRefresh(context),
        child: new Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
          child: new FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              var medecins = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: medecins != null ? medecins.length : 0,
                itemBuilder: (BuildContext context, int index) {
                  print(medecins[index].toString());
                  return new Card(
                      child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new CircleAvatar(),
                                new Text(medecins[index]['prenom']),
                                new Text(medecins[index]['nom'])
                              ])),
                      new Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 50.0),
                          child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text('${medecins[index]['prenom']}'),
                                new Text('${medecins[index]['specialite']}'),
                                new Text('Adresse\n${medecins[index]['adresse']['numero']}, ${medecins[index]['adresse']['rue']}')
                              ])),
                    ],
                  ));
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<Null> _onRefresh(BuildContext context) async {
    future =
        DefaultAssetBundle.of(context).loadString('assets/data/medecins.json');
    try {
      await future;
    } catch (e) {} finally {
      setState(() {});
      return null;
    }
  }
}
