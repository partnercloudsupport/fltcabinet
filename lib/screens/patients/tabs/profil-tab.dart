import 'package:flutter/material.dart';

import '../../../components/CabinetTitle.dart';
import '../../../components/header.dart';

class ProfilTab extends StatefulWidget {
  @override
  _ProfilTabState createState() => _ProfilTabState();
}

class _ProfilTabState extends State<ProfilTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          new Header('assets/images/header-profil.jpg'),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CabinetTitle('Profil Utilisateur',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
