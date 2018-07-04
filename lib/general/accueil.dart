import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;
import '../services/userService.dart';

final TextEditingController _loginController = TextEditingController();
final TextEditingController _passwdController = TextEditingController();

class Accueil extends StatefulWidget {
  static String routeName = '/accueil';
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  double _height = 150.0;
  double _heightButton = utils.getHeightInput();
  bool _isShow = true;
  final int _maxLength = 25;
  String _text = '';

  _seConnecter() {
    // Navigator.of(context).pushNamed('/monprofil');
    String _login = _loginController.text;
    String _passwd = _passwdController.text;
    _loginController.text = '';
    _passwdController.text = '';
    print(verifyUser(_login, _passwd));
    verifyUser(_login, _passwd)
        ?? Navigator.of(context).pushNamed('/listeuser');
        // : Navigator.of(context).popAndPushNamed('/accueil');
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _height = MediaQuery.of(context).viewInsets.bottom == 0.0 ? 150.0 : 0.0;
      _heightButton =
          MediaQuery.of(context).viewInsets.bottom == 0.0 ? 55.0 : 0.0;
    });

    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.only(top: 0.0),
          child: new Container(
            height: _height,
            decoration: BoxDecoration(
              border: Border.all(
                color: utils.getColorGlobal(),
              ),
              borderRadius: BorderRadius.circular(75.0),
            ),
            child: new CircleAvatar(
              backgroundImage: new AssetImage('assets/images/medecin.png'),
              radius: 75.0,
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: new Container(
            width: utils.getWidthInput(),
            height: utils.getHeightInput(),
            decoration: BoxDecoration(
              border: Border.all(color: utils.getColorGlobal()),
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.only(
              left: 15.0,
            ),
            child: new TextField(
              controller: _loginController,
              decoration: InputDecoration(
                hintText: 'LOGIN',
                border: InputBorder.none,
              ),
              onChanged: (String newValue) {
                if (newValue.length < _maxLength) {
                  _text = newValue;
                } else {
                  _loginController.value = TextEditingValue(
                    text: _text,
                    selection: TextSelection(
                      baseOffset: _maxLength,
                      extentOffset: _maxLength,
                      affinity: TextAffinity.downstream,
                      isDirectional: false,
                    ),
                    composing: TextRange(
                      start: 0,
                      end: _maxLength,
                    ),
                  );
                  _loginController.text = _text.trim().toLowerCase().toString();
                }
              },
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: new Container(
            height: utils.getHeightInput(),
            width: utils.getWidthInput(),
            padding: EdgeInsets.only(
              left: 15.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: utils.getColorGlobal()),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 240.0,
                  child: new TextField(
                    controller: _passwdController,
                    decoration: InputDecoration(
                      hintText: 'MOT DE PASSE',
                      border: InputBorder.none,
                    ),
                    obscureText: _isShow,
                    onChanged: (String newValue) {
                      if (newValue.length < _maxLength) {
                        _text = newValue;
                      } else {
                        _passwdController.value = TextEditingValue(
                          text: _text,
                          selection: TextSelection(
                            baseOffset: _maxLength,
                            extentOffset: _maxLength,
                            affinity: TextAffinity.downstream,
                            isDirectional: false,
                          ),
                          composing: TextRange(
                            start: 0,
                            end: _maxLength,
                          ),
                        );
                        _passwdController.text =
                            _text.trim().toLowerCase().toString();
                      }
                    },
                  ),
                ),
                new Container(
                  width: 25.0,
                  child: new IconButton(
                    icon: (_isShow
                        ? Icon(
                            Icons.visibility_off,
                            color: utils.getColorGlobal(),
                          )
                        : Icon(
                            Icons.visibility,
                            color: utils.getColorGlobal(),
                          )),
                    iconSize: 20.0,
                    onPressed: () {
                      setState(() {
                        _isShow = !_isShow;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(
            top: 5.0,
          ),
          child: new Container(
            width: utils.getWidthInput(),
            height: _heightButton,
            decoration: BoxDecoration(
              color: utils.getColorGlobal(),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: new MaterialButton(
              child: Text(
                'SE CONNECTER',
                style: utils.getStyleWhite(),
              ),
              onPressed: _seConnecter,
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: new Text(
            'Version 1.0.0, (c) randriambololona 2018',
            style: utils.getMyStyleGlobal(),
          ),
        ),
      ],
    );
  }
}
