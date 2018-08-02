import 'package:flutter/widgets.dart';

import '../../../components/header.dart';

class PrendreRdvTab extends StatefulWidget {
  @override
  _PrendreRdvTabState createState() => _PrendreRdvTabState();
}

class _PrendreRdvTabState extends State<PrendreRdvTab> {
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
        new Container(
          child: new Text('Prendre un RDV'),
        ),
      ],
    );
  }
}
