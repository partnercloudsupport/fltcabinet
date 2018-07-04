import 'package:flutter/material.dart';

import '../interface/user.dart';

class ProfilMedecin extends StatefulWidget {
  static const String routeNate = 'profilmedecin';
  @override
  _ProfilMedecinState createState() => _ProfilMedecinState();
}

class _ProfilMedecinState extends State<ProfilMedecin> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: FutureBuilder<User>(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.login);
          } else {
            return Text('Impossible to load data.');
          }
        },
      ),
    );
  }
}
