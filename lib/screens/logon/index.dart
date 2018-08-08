import 'package:flutter/material.dart';
import '../../components/ensureVisibleWhenFocus.dart';
import '../../utils/utils.dart' as utils;
import 'package:validator/validator.dart';

class LogOn extends StatefulWidget {
  BuildContext context;
  LogOn({this.context});
  @override
  _LogOnState createState() => _LogOnState();
}

class _LogOnState extends State<LogOn> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    print('screen/logon/index : program start');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    FocusNode _focusNodeLogin = new FocusNode();
    FocusNode _focusNodePasswd = new FocusNode();

    return new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: new Container(
          constraints: BoxConstraints(maxHeight: screenSize.height),
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 60.0),
          child: new Form(
              key: _formKey,
              onChanged: () {
                setState(() {
                  _formKey.currentState.validate();
                });
              },
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new CircleAvatar(
                        child: new Image.asset('assets/images/medecin.png'),
                        radius: 75.0),
                    new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                    new EnsureVisibleWhenFocused(
                        focusNode: _focusNodeLogin,
                        child: new TextFormField(
                            validator: (String str) {
                              if (isNull(str.trim()))
                                return 'Ce champ est obligatoire';
                            },
                            decoration:
                                new InputDecoration(labelText: 'IDENTIFIANT'))),
                    new EnsureVisibleWhenFocused(
                        focusNode: _focusNodePasswd,
                        child: new TextFormField(
                            validator: (String value) {
                              if (isNull(value.trim()))
                                return 'Ce champs est obligatoire';
                            },
                            obscureText: _obscureText,
                            decoration: new InputDecoration(
                                labelText: 'MOT DE PASSE',
                                suffixIcon: new FlatButton(
                                    child: new Icon(
                                      _obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: utils.colorBase,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    })))),
                    new Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
                      child: new FlatButton.icon(
                        label:
                            new Text('CONNEXION', style: utils.myStyleGlobal),
                        icon: new Icon(Icons.input, color: utils.colorBase),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print('Tous champs ok');
                            Navigator.of(context).pushNamed('/patient');
                          }
                        },
                      ),
                    )
                  ])),
        ),
      );
    });
  }
}
