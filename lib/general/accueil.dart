import 'package:flutter/material.dart';
import '../utils/utils.dart' as util;
import '../services/userService.dart';

final TextEditingController _loginController = TextEditingController();
final TextEditingController _passwdController = TextEditingController();

class Accueil extends StatefulWidget {
  static const String routeName = '/accueil';
  @override
  State<StatefulWidget> createState() => AccueilState();
}

class AccueilState extends State<Accueil> {
  String text = '';
  final int _maxLength = 10;
  bool _showPasswordInput = true;

  void _showPassword() {
    setState(() {
      _showPasswordInput = !_showPasswordInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Cabinet RAZA',
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
              width: 280.0,
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.only(left: 10.0),
                    width: 220.0,
                    child: new TextField(
                      obscureText: _showPasswordInput,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: 'MOT DE PASSE',
                      ),
                      controller: _passwdController,
                      onChanged: (String value) {
                        if (value.length <= _maxLength) {
                          text = value;
                        } else {
                          _passwdController.value = new TextEditingValue(
                              text: text,
                              selection: new TextSelection(
                                  baseOffset: _maxLength,
                                  extentOffset: _maxLength,
                                  affinity: TextAffinity.downstream,
                                  isDirectional: false),
                              composing:
                                  new TextRange(start: 0, end: _maxLength));
                          _passwdController.text = text;
                        }
                      },
                    ),
                  ),
                  new IconButton(
                    icon: new Icon(
                      _showPasswordInput
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: util.getColorBase(),
                    ),
                    onPressed: _showPassword,
                  ),
                ],
              ),
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
              width: 280.0,
              child: new TextField(
                  decoration: new InputDecoration(
                    hintText: 'LOGIN',
                    border: InputBorder.none,
                  ),
                  controller: _loginController,
                  obscureText: false,
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
              height: 45.0,
              width: 270.0,
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: new MaterialButton(
                color: util.getColorBase(),
                textColor: util.getColorWhite(),
                child: new Text('SE CONNECTER'),
                onPressed: () {
                  print('ID : ${_loginController.text} et ${_passwdController.text}');
                  print(verifyUser(_loginController.text, _passwdController.text));
                  verifyUser(_loginController.text, _passwdController.text)? Navigator.of(context).pushNamed('/monprofil') : Navigator.of(context).pushNamed('/accueil');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
