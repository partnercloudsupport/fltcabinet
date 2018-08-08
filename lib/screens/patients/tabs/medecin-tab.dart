import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../components/card-widget.dart';

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
    final Size screen = MediaQuery.of(context).size;

    return new Container(
        constraints: BoxConstraints(minHeight: screen.height, maxHeight: screen.height),
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
                            return CardWidget(data: medecins[index]);
                          });
                    }))));
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
