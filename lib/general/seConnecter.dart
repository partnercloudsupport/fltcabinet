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

class _SeConnecterState extends State<SeConnecter>
    with SingleTickerProviderStateMixin {
  AnimationController _loginButtonController;
  Animation<double> _iconAnimation;

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
    super.initState();
    signOutWithGoogle();

    _loginButtonController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 3000),
    );
    _iconAnimation = new CurvedAnimation(
      parent: _loginButtonController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _loginButtonController.forward(from: 2.0);
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: _height,
              child: CircleAvatar(
                backgroundImage: new AssetImage('assets/images/medecin.png'),
                radius: 75.0,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: new Container(
                    width: utils.widthInput - 50.0,
                    height: utils.heightInput,
                    child: new TextField(
                      controller: _loginController,
                      decoration: InputDecoration(
                        labelStyle: utils.myStyleTitle,
                        labelText: 'LOGIN',
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: utils.colorBase,
                          size: 30.0,
                        ),
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
                          _loginController.text =
                              _text.trim().toLowerCase().toString();
                        }
                      },
                    ),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: new Container(
                    height: utils.heightInput,
                    width: utils.widthInput,
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          width: utils.widthInput - 50.0,
                          child: new TextField(
                            controller: _passwdController,
                            decoration: InputDecoration(
                              labelText: 'MOT DE PASSE',
                              labelStyle: utils.myStyleTitle,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: utils.colorBase,
                                size: 30.0,
                              ),
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
                        IconButton(
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
                        // ),
                      ],
                    ),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: new Container(
                    width: utils.widthInput - 25.0,
                    height: _heightButton,
                    decoration: BoxDecoration(
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
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.arrow_forward_ios,
                        color: utils.colorBase,
                        size: 18.0,
                      ),
                      Text(
                        'Vous s\'inscrire',
                        style: utils.myStyleGlobal,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Inscription(),
                        ));
                  },
                ),
                FlatButton(
                  child: Text('> Connecter avec google'),
                  onPressed: () {
                    signInWithGoogle().then((String name) {
                      name.isEmpty
                          ? Navigator.of(context).pushNamed('/listemedecin')
                          : Navigator.of(context).pushNamed('/profilpatient');
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
