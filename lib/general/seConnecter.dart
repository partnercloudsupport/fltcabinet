import 'dart:async';

import 'package:flutter/material.dart';
import '../interface/user.dart';

class SeConnecter extends StatefulWidget {
  static const String routeName = '/seconnecter';
  @override
  State<StatefulWidget> createState() => new SeConnecterState();
}

class SeConnecterState extends State<SeConnecter> {
  User user = new User();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _autovalidate = false;

  final colorG = new Color.fromRGBO(3, 175, 340, 1.0);
  final colorB = new Color.fromRGBO(255, 255, 255, 1.0);
  static const colorb = Color.fromRGBO(255, 255, 255, 1.0);
  static const colorg = Color.fromRGBO(3, 175, 340, 1.0);
  static const myStyle = TextStyle(color: colorb, fontSize: 15.0);
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
    if (!form.validate()){
      _autovalidate = true;
      showInSnakeBar('IMPOSSIBLE DE VOUS CONNECTER');
    }
    else
      showInSnakeBar(user.login + ' et ' + user.passwd);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: colorG,
        title: const Text('Se connecter'),
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
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
                decoration: const InputDecoration(
                  // hintText: 'LOGIN',
                  icon: const Icon(
                    Icons.person,
                    color: colorg,
                  ),
                  labelText: 'LOGIN *',
                ),
              ),
              new TextFormField(
                onSaved: (String passwd) {
                  user.passwd = passwd;
                },
                validator: _validatorPasswd,
                enabled: !user.login.isNotEmpty,
                keyboardType: TextInputType.number,
                maxLength: 8,
                obscureText: true,
                decoration: const InputDecoration(
                    icon: const Icon(
                      Icons.visibility,
                      color: colorg,
                    ),
                    labelText: 'MOT DE PASSE *'),
              ),
              new Center(
                child: new RaisedButton(
                  color: colorG,
                  child: const Text(
                    'SE CONNECTER',
                    style: myStyle,
                  ),
                  onPressed: _handleSubmitted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
