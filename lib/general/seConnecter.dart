import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;
import '../services/userService.dart';
import 'inscription.dart';
import 'singInGoogle.dart';

final TextEditingController _loginController = TextEditingController();
final TextEditingController _passwdController = TextEditingController();

class SeConnecter extends StatefulWidget {
  static String routeName = '/accueil';
  @override
  _SeConnecterState createState() => _SeConnecterState();
}

class _SeConnecterState extends State<SeConnecter> {
  double _height = 150.0;
  double _heightButton = utils.heightInput;
  bool _isShow = true;
  final int _maxLength = 25;
  String _text = '';

  /* appuyer sur seConnecter et vérifier login et passwd */
  _seConnecter() {
    final String _login = _loginController.text;
    final String _passwd = _passwdController.text;

    _loginController.text = '';
    _passwdController.text = '';
    isUser(_login, _passwd)
        ? Navigator.of(context).pushNamed('/profilpatient')
        : null;
  }

  @override
  void initState() {
    signOutWithGoogle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _height = MediaQuery.of(context).viewInsets.bottom == 0.0 ? 150.0 : 0.0;
      _heightButton =
          MediaQuery.of(context).viewInsets.bottom == 0.0 ? 55.0 : 0.0;
    });

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new Container(
            height: _height,
            decoration: BoxDecoration(
              border: Border.all(
                color: utils.colorGlobal,
              ),
              borderRadius: BorderRadius.circular(75.0),
            ),
            child: new CircleAvatar(
              backgroundImage: new AssetImage('assets/images/medecin.png'),
              radius: 75.0,
            ),
          ),
        new Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: new Container(
            width: utils.widthInput - 50.0,
            height: utils.heightInput,
            // decoration: BoxDecoration(
            //   border: Border.all(color: utils.colorGlobal),
            //   borderRadius: BorderRadius.circular(30.0),
            // ),
            // padding: EdgeInsets.only(left: 15.0,),
            child: new TextField(
              controller: _loginController,
              decoration: InputDecoration(
                hintText: 'LOGIN',
                // border: InputBorder.none,
                prefixIcon: Icon(Icons.person_outline, color: utils.colorBase,),
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
            height: utils.heightInput,
            width: utils.widthInput,
            // padding: EdgeInsets.only(left: 15.0,),
            // decoration: BoxDecoration(
            //   border: Border.all(color: utils.colorGlobal),
            //   borderRadius: BorderRadius.circular(30.0),
            // ),
            child: new Row(
              children: <Widget>[
                new Container(
                  width: utils.widthInput - 50.0,
                  child: new TextField(
                    controller: _passwdController,
                    decoration: InputDecoration(
                      hintText: 'MOT DE PASSE',
                      // border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock, color: utils.colorBase,) ,
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
                            color: utils.colorGlobal,
                          )
                        : Icon(
                            Icons.visibility,
                            color: utils.colorGlobal,
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
            width: utils.widthInput - 25.0,
            height: _heightButton,
            decoration: BoxDecoration(
              // color: utils.colorGlobal,
              border: Border.all(color: utils.colorBase),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: new MaterialButton(
              child: Text(
                'SE CONNECTER',
                style: utils.myStyleGlobal,
              ),
              onPressed: _seConnecter,
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 0.0),
          child: new Container(
            height: utils.heightInput,
            width: utils.widthInput,
            child: FlatButton(
              child: Text(
                '> Vous s\'inscrire',
                style: utils.myStyleGlobal,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Inscription(),
                    ));
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0.0),
          child: FlatButton(
            child: Text('> Connecter avec google'),
            onPressed: () {
              signInWithGoogle().then((String name) {
                name.isEmpty
                    ? Navigator.of(context).pushNamed('/listemedecin')
                    : Navigator.of(context).pushNamed('/profilpatient');
              });
            },
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 0.0, bottom: 5.0,),
          child: new Text(
            '(c) randriambololona 2018',
            style: utils.myStyleGlobal,
          ),
        ),
      ],
    );
  }
}
