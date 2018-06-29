import 'package:flutter/material.dart';
import '../utils/utils.dart' as util;

final TextEditingController _loginController = TextEditingController();
final TextEditingController _passwdController = TextEditingController();

class SeConnecter extends StatefulWidget {
  static const String routeName = '/seconnecter';
  @override
  State<StatefulWidget> createState() => SeConnecterState();
}

class SeConnecterState extends State<SeConnecter> {
  String text = ""; // empty string to carry what was there before it
  final int _maxLength = 20;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Interne Devices',
        ),
        backgroundColor: util.getColorBase(),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image(
              image: new AssetImage('assets/images/medecin.png'),
              width: 100.0,
            ),
            new Padding(
              padding: new EdgeInsets.only(
                top: 10.0,
              ),
            ),
            new Container(
              decoration: new BoxDecoration(
                border: new Border.all(width: 1.0, color: util.getColorBase()),
                borderRadius: new BorderRadius.circular(22.0),
              ),
              width: 300.0,
              child: new TextField(
                  controller: _loginController,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: 'IDENTIFIANT',
                    prefixIcon: new Icon(
                      Icons.person_outline,
                      color: util.getColorBase(),
                    ),
                  ),
                  onChanged: (String newVal) {
                    if (newVal.length <= _maxLength) {
                      text = newVal;
                    } else {
                      _loginController.value = new TextEditingValue(
                          text: text,
                          selection: new TextSelection(
                              baseOffset: _maxLength,
                              extentOffset: _maxLength,
                              affinity: TextAffinity.downstream,
                              isDirectional: false),
                          composing: new TextRange(start: 0, end: _maxLength));
                      _loginController.text = text;
                    }
                  }),
            ),
            new Padding(
              padding: new EdgeInsets.only(
                top: 10.0,
              ),
            ),
            new Container(
              decoration: new BoxDecoration(
                border: new Border.all(width: 1.0, color: util.getColorBase()),
                borderRadius: new BorderRadius.circular(22.0),
              ),
              width: 300.0,
              child: new TextField(
                  controller: _passwdController,
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: 'MOT DE PASSE',
                    prefixIcon: new Icon(
                      Icons.lock,
                      color: util.getColorBase(),
                    ),
                  ),
                  obscureText: true,
                  onChanged: (String newVal) {
                    if (newVal.length <= _maxLength) {
                      text = newVal;
                    } else {
                      _passwdController.value = new TextEditingValue(
                          text: text,
                          selection: new TextSelection(
                              baseOffset: _maxLength,
                              extentOffset: _maxLength,
                              affinity: TextAffinity.downstream,
                              isDirectional: false),
                          composing: new TextRange(start: 0, end: _maxLength));
                      _passwdController.text = text;
                    }
                  }),
            ),
            new Padding(
              padding: new EdgeInsets.only(
                top: 10.0,
              ),
            ),
            new MaterialButton(
              color: util.getColorBase(),
              textColor: util.getColorWhite(),
              child: new Text('SE CONNECTER'),
              onPressed: () {
                print('${_loginController.text}');
                Navigator.of(context).pushNamed('/monprofil');
              },
            ),
          ],
        ),
      ),
    );
  }
}
