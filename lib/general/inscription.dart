import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:validator/validator.dart';

import '../utils/utils.dart' as utils;
import '../services/patientService.dart' as patientSrv;
import '../general/seConnecter.dart';
import 'connect.dart';
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
  static final _formStep0 = GlobalKey<FormState>();
  static final _formStep1 = GlobalKey<FormState>();
  static final _formStep2 = GlobalKey<FormState>();
  static final _formStep3 = GlobalKey<FormState>();
  static final _formStep4 = GlobalKey<FormState>();
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
      content: Form(
        key: _formStep0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (String value) {
                    if (value.trim().isEmpty)
                      return 'Veuillez renseigner votre nom';
                  },
                  controller: _nomController,
                  decoration: InputDecoration(
                    hintText: 'LAVILLIER',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (String value) {
                    if (value.trim().isEmpty)
                      return 'Veuillez renseigner votre prénom';
                  },
                  controller: _prenomController,
                  decoration: InputDecoration(
                    hintText: 'Marc',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (value) {
                    if (value.trim().isEmpty)
                      return 'Veuillez renseigner ce champ';
                  },
                  controller: _dateNaissanceController,
                  decoration: InputDecoration(
                    hintText: '01/01/2000',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (String value) {
                    if (value.isEmpty) return 'Ce champ ne peut pas être vide';
                  },
                  controller: _lieuNaissanceController,
                  decoration: InputDecoration(
                    hintText: 'Paris',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    /* ==================================================== End step0 */
    Step(
      title: Text(
        'Identification',
        style: utils.myStyleTitle,
      ),
      state: _currentStep == 1 ? StepState.editing : StepState.indexed,
      isActive: false,
      content: Form(
        key: _formStep1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (String value) {
                    if (value.trim().isEmpty)
                      return 'Veuillez renseigner ce champ';
                  },
                  controller: _loginController,
                  decoration: InputDecoration(
                    hintText: 'LOGIN',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                width: utils.widthInput,
                height: utils.heightInput,
                child: TextFormField(
                  validator: (String value) {
                    if (value.trim().isEmpty)
                      return 'Veuillez renseigner ce champ';
                  },
                  controller: _passwdController,
                  decoration: InputDecoration(
                    hintText: 'MOT DE PASSE',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    /* =========================================== end step1 */
    Step(
      title: Text(
        'Carte de payement',
        style: utils.myStyleTitle,
      ),
      content: Form(
        key: _formStep2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: utils.heightInput,
                    width: 50.0,
                    child: TextFormField(
                      validator: (value) {
                        if (!isLength(value.trim(), 3, 3))
                          return 'Veuillez renseigner ce champ';
                      },
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
                    height: utils.heightInput,
                    width: utils.widthInput - utils.widthLabel - 50.0,
                    child: TextFormField(
                      validator: (value) {
                        if (!isLength(value.trim(), 16, 16))
                          return 'Une erreur dans le champ';
                      },
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
                    height: utils.heightInput,
                    width: 100.0,
                    child: TextFormField(
                      validator: (value) {
                        if (value.trim().isEmpty) return 'Renseignez le champ';
                      },
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
    ),
    /* =========================================================== End step2 */
    Step(
      title: Text(
        'Adresse personnelle',
        style: utils.myStyleTitle,
      ),
      content: Form(
        key: _formStep3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (value) {
                    if (value.trim().isEmpty || value.trim().length > 7)
                      return 'Format';
                  },
                  controller: _numeroRueController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'NUMERO RUE',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (value) {
                    if (value.trim().isEmpty)
                      return 'Veuillez renseigner ce champ';
                  },
                  controller: _libelleController,
                  decoration: InputDecoration(
                    hintText: 'RUE',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (String value) {
                    if (value.trim().isEmpty || value.trim().length != 5)
                      return 'Format incorrect';
                  },
                  controller: _codePostalController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'CODE POSTAL',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (String value) {
                    if (value.trim().isEmpty)
                      return 'Veuillez renseigner ce champ';
                  },
                  controller: _villeController,
                  decoration: InputDecoration(
                    hintText: 'VILLE',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    /* ======================================================= End Step3 */
    Step(
      title: Text(
        'Contact',
        style: utils.myStyleTitle,
      ),
      content: Form(
        key: _formStep4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (String value) {
                    if (value.trim().length != 12 ||
                        value.trim().isEmpty ||
                        value.contains(' '))
                      return 'Veuillez renseigner ce champ';
                  },
                  controller: _telephoneController,
                  decoration: InputDecoration(
                    hintText: '+33663193641',
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Container(
                height: utils.heightInput,
                width: utils.widthInput,
                child: TextFormField(
                  validator: (String value) {
                    if (!isEmail(value.trim()))
                      return 'Veuillez renseigner ce champ';
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'rarinjaka@gmail.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    /* ================================================== End step4 */
  ];

//insert into database all informations
  _validateInscription() {
    if (!patientSrv.addPatient(
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
        _emailController))
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SeConnecter()));
  }

  void _jumpForward() {
    setState(() {
      switch (_currentStep) {
        case 0:
          if (_formStep0.currentState.validate()) _currentStep++;
          break;
        case 1:
          if (_formStep1.currentState.validate()) _currentStep++;
          break;
        case 2:
          if (_formStep2.currentState.validate()) _currentStep++;
          break;
        case 3:
          if (_formStep3.currentState.validate()) _currentStep++;
          break;
        case 4:
          if (_formStep4.currentState.validate()) _confirmDialog();
          break;
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
    _nomController.clear();
    _prenomController.clear();
    _dateNaissanceController.clear();
    _lieuNaissanceController.clear();
    _loginController.clear();
    _passwdController.clear();
    _emailController.clear();
    _numeroCarteController.clear();
    _numeroRueController.clear();
    _codePostalController.clear();
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
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> CupertinoNavigationDemo())),
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
