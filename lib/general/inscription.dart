import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/utils.dart' as utils;
import '../services/patientService.dart' as patientSrv;

// TextEditingController _civiliteController = new TextEditingController();
TextEditingController _nomController = new TextEditingController();
TextEditingController _prenomController = new TextEditingController();
TextEditingController _dateNaissanceController = new TextEditingController();
TextEditingController _lieuNaissanceController = new TextEditingController();
TextEditingController _loginController = new TextEditingController();
TextEditingController _passwdController = new TextEditingController();
TextEditingController _telephoneController = new TextEditingController();
TextEditingController _emailController = new TextEditingController();
TextEditingController _cryptoController = new TextEditingController();
TextEditingController _numeroCarteController = new TextEditingController();
TextEditingController _dateExpirationController = new TextEditingController();
TextEditingController _numeroRueController = new TextEditingController();
TextEditingController _libelleController = new TextEditingController();
TextEditingController _codePostalController = new TextEditingController();
TextEditingController _villeController = new TextEditingController();

class Inscription extends StatefulWidget {
  static const String routeName = '/inscription';
  final Widget title;

  Inscription({this.title});

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final DocumentReference documentReference =
      Firestore.instance.collection('patients').document('personne');
  RegExp regExpEmail = new RegExp(r"([a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4})");
  static List<String> _civilites = ['MADAME', 'MADEMOISELLE', 'MONSIEUR'];
  static int _currentStep;

  List<Step> _steps = [
    Step(
      title: Text(
        'Information personnelle',
        style: utils.myStyleTitle,
      ),
      isActive: false,
      state: StepState.indexed,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput - 100.0,
              child: DropdownButton(
                hint: Text(
                  'Civilité : ',
                  style: utils.myStyleGlobal,
                ),
                items: _civilites
                    .map((code) => DropdownMenuItem(
                          value: code,
                          child: Text(code.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (String code) {
                  print(code.toString());
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _nomController,
                decoration:
                    InputDecoration(hintText: 'NOM', border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _prenomController,
                decoration: InputDecoration(
                    hintText: 'PRENOM', border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _dateNaissanceController,
                decoration: InputDecoration(
                    hintText: 'DATE DE NAISSANCE', border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _lieuNaissanceController,
                decoration: InputDecoration(
                    hintText: 'VILLE DE NAISSANCE', border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    ),
    Step(
      title: Text(
        'Identification',
        style: utils.myStyleTitle,
      ),
      state: _currentStep == 1 ? StepState.editing : StepState.indexed,
      isActive: false,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _loginController,
                decoration: InputDecoration(
                    hintText: 'LOGIN', border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _passwdController,
                decoration: InputDecoration(
                    hintText: 'MOT DE PASSE', border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    ),
    Step(
      title: Text(
        'Carte de payement',
        style: utils.myStyleTitle,
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: utils.widthLabel,
                  child: Text(
                    'Crypto : ',
                    style: utils.myStyleGlobal,
                  ),
                ),
                Container(
                  width: 50.0,
                  decoration: BoxDecoration(
                      // border: Border.all(color: utils.colorGlobal),
                      ),
                  child: TextField(
                    controller: _cryptoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '000',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: utils.widthLabel,
                  child: Text(
                    'Numéro : ',
                    style: utils.myStyleGlobal,
                  ),
                ),
                Container(
                  width: utils.widthInput - utils.widthLabel - 50.0,
                  decoration: BoxDecoration(
                      // border: Border.all(color: utils.colorGlobal),
                      ),
                  child: TextField(
                    controller: _numeroCarteController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '0000 0000 0000 0000',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: utils.widthLabel,
                  child: Text(
                    'Expirée le : ',
                    style: utils.myStyleGlobal,
                  ),
                ),
                Container(
                  width: utils.widthInput - utils.widthLabel - 50.0,
                  decoration: BoxDecoration(
                      // border: Border.all(color: utils.colorGlobal),
                      ),
                  child: TextField(
                    controller: _dateExpirationController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '01/01/1990',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Step(
      title: Text(
        'Adresse personnelle',
        style: utils.myStyleTitle,
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _numeroRueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'NUMERO RUE', border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _libelleController,
                decoration:
                    InputDecoration(hintText: 'RUE', border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _codePostalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'CODE POSTAL', border: InputBorder.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: utils.widthInput,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _villeController,
                decoration: InputDecoration(
                    hintText: 'VILLE', border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    ),
    Step(
      title: Text(
        'Contact',
        style: utils.myStyleTitle,
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: 200.0,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                controller: _telephoneController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0663193641',
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Container(
              width: 200.0,
              decoration: BoxDecoration(
                border: Border.all(color: utils.colorGlobal),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                textAlign: TextAlign.center,
                controller: _emailController,
                decoration: InputDecoration(
                    prefixText: '',
                    border: InputBorder.none,
                    hintText: 'rarinjaka@gmail.com'),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
        ],
      ),
    ),
  ];

//insert into database all informations
  _validateInscription() {
    patientSrv.addPatient(
        _nomController,
        _prenomController,
        _dateNaissanceController,
        _lieuNaissanceController,
        _loginController,
        _passwdController,
        _cryptoController,
        _numeroCarteController,
        _dateExpirationController,
        _numeroRueController,
        _libelleController,
        _codePostalController,
        _villeController,
        _telephoneController,
        _emailController
        );
  }

  void _jumpForward() {
    setState(() {
      if (_currentStep != 4) {
        _currentStep++;
      } else {
        _confirmDialog();
      }
    });
  }

  _jumpBackward() {
    setState(() {
      if (_currentStep != 0) {
        _currentStep--;
      }
    });
  }

  _confirmDialog() {
    AlertDialog dialog = AlertDialog(
      title: Text(
        'DERNIERE ETAPE?',
        style: utils.myStyleGlobal,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Toutes ses informations sont correctes?'),
          ],
        ),
      ),
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          child: Text(
            'Annuler',
            style: utils.myStyleGlobal,
          ),
        ),
        FlatButton(
          onPressed: _validateInscription,
          child: Text(
            'VALIDER',
            style: utils.myStyleGlobal,
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
    );
  }

  @override
  void initState() {
    _currentStep = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: utils.colorBase),
      title: 'Inscription',
      home: Scaffold(
        appBar: AppBar(
          title: widget.title,
          elevation: 0.0,
          backgroundColor: utils.colorGlobal,
          actions: <Widget>[
            IconButton(
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.exit_to_app,
                color: utils.colorWhite,
              ),
              iconSize: 30.0,
              onPressed: null,
            ),
          ],
        ),
        body: Scrollbar(
          child: Stepper(
            steps: _steps,
            currentStep: _currentStep,
            type: StepperType.vertical,
            onStepContinue: _jumpForward,
            onStepCancel: _jumpBackward,
          ),
        ),
      ),
    );
  }
}
