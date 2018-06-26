import 'dart:async';
import 'package:flutter/material.dart';

import '../interface/user.dart';
import '../patients/monProfil.dart' as moprofil;
import '../utils/utils.dart' as utils;

class Accueil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new AccueilState();
}

class AccueilState extends State<Accueil> {
  User user = new User();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _autovalidate = false;

  static const colorg = Color.fromRGBO(3, 175, 340, 1.0);
  String login = "";
  String passwd = "";
  bool showPasswd = true;

  Future<bool> _warnUserAboutInvalidData() async {
    return true;
  }

  String _validatorLogin(String value) {
    final RegExp loginExp = new RegExp(r'^[A-Za-z]+$');
    if (value.isEmpty) {
      return 'login obligatoire';
    }
    if (!loginExp.hasMatch(value)) {
      return 'login en toute lettre';
    }
    return null;
  }

  String _validatorPasswd(String passwd) {
    // final RegExp passwdReg = new RegExp(r'^[0-9]');
    if (passwd.isEmpty) return 'mot de pass obligatoire';
    if (passwd.length < 8) return 'mot de passe en 8 chiffres';
    return null;
  }

  void showInSnakeBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
    ));
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
      showInSnakeBar('IMPOSSIBLE DE VOUS CONNECTER');
    } else {
      form.save();
      if (user.login == 'njaka' && user.passwd == 'arinjaka') {
        // showInSnakeBar(user.login + ' est reconnu.e ');
        Navigator.of(context).pushNamed('/monprofil');
      } else
        showInSnakeBar(user.login + ' n\'est pas dans la liste.');
        // Navigator.of(context).pushNamed('/inscription');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
        '/moprofil': (BuildContext context) => new moprofil.MonProfil(),
      },
      home: new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          backgroundColor: utils.colorGlobal(),
        ),
        body: new Container(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: new Form(
            key: _formKey,
            autovalidate: _autovalidate,
            onWillPop: _warnUserAboutInvalidData,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 25.0,
                ),
                new TextFormField(
                  onSaved: (String value) {
                    user.login = value;
                  },
                  validator: _validatorLogin,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    // hintText: 'LOGIN',
                    icon: new Icon(
                      Icons.person,
                      color: utils.colorGlobal(),
                    ),
                    labelText: 'LOGIN *',
                  ),
                ),
                new TextFormField(
                  onSaved: (String passwd) {
                    setState(() {
                      user.passwd = passwd;
                    });
                  },
                  validator: _validatorPasswd,
                  // enabled: !user.login.isNotEmpty,
                  // keyboardType: TextInputType.number,
                  maxLength: 8,
                  obscureText: true,
                  decoration: new InputDecoration(
                      icon: new Icon(
                        Icons.visibility,
                        color: utils.colorGlobal(),
                      ),
                      labelText: 'MOT DE PASSE *'),
                ),
                new Center(
                  child: new RaisedButton(
                    color: utils.colorGlobal(),
                    child: new Text(
                      'SE CONNECTER',
                      style: utils.getMyStyle(),
                    ),
                    onPressed: _handleSubmitted,
                  ),
                ),
                new Center(
                  child: new Padding(
                    padding: new EdgeInsets.only(top: 10.0),
                    child: new Text(
                      'OU',
                      style: new TextStyle(color: utils.colorGlobal()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
