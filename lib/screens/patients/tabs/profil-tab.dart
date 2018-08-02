import 'package:flutter/material.dart';

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
    return new ListView(
      children: <Widget>[
        new Header(),
        new Text('Profil'),
      ],
    );
  }
}
