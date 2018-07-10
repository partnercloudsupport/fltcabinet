import 'package:cloud_firestore/cloud_firestore.dart';
import '../interface/patient.dart';
import '../services/userService.dart' as userSrv;

void addPatient(
    nomCtrl,
    prenomCtrl,
    dateNaissanceCtrl,
    lieuNaissanceCtrl,
    loginCtrl,
    passwdCtrl,
    cryptoCtrl,
    numeroCarteCtrl,
    dateExpirationCtrl,
    numeroRueCtrl,
    libelleCtrl,
    codePostalCtrl,
    villeCtrl,
    telephoneCtrl,
    emailCtrl) {
  String nom = nomCtrl.text.toString().toLowerCase();
  String prenom = prenomCtrl.text.toString().toLowerCase();
  String dateNaissance = dateNaissanceCtrl.text.toString().toLowerCase();
  String lieuNaissance = lieuNaissanceCtrl.text.toString().toLowerCase();
  String login = loginCtrl.text.toString().toLowerCase();
  String passwd = passwdCtrl.text.toLowerCase().toString();
  int crypto = int.parse(cryptoCtrl.text.toString().trim().toString());
  int numeroCarte =
      int.parse(numeroCarteCtrl.text.toString().trim().toString());
  String dateExpiration = dateExpirationCtrl.text.toString().trim().toString();
  int numeroRue = int.parse(numeroRueCtrl.text.toString().trim());
  String libelle = libelleCtrl.text.toString().trim().toLowerCase().toString();
  int codePostal = int.parse(codePostalCtrl.text.toString().trim());
  String ville = villeCtrl.text.toString().trim().toLowerCase().toString();
  String telephone =
      telephoneCtrl.text.toString().trim().toLowerCase().toString();
  String email = emailCtrl.text.toString().trim().toLowerCase().toString();

  Patient patient = new Patient(
      nom,
      prenom,
      dateNaissance,
      lieuNaissance,
      login,
      passwd,
      crypto,
      numeroCarte,
      dateExpiration,
      numeroRue,
      libelle,
      codePostal,
      ville,
      telephone,
      email);
  final DocumentReference _patientRef =
      Firestore.instance.collection('patients').document(patient.login);
  userSrv.addUser(login, passwd, 1)
      ? print('Added')
      : _patientRef.setData(patient.toJson()).whenComplete(() {
          print('\n Added with success');
        }).catchError((error) {
          print(error);
        });
}

bool updatePatient(Patient patient) {
  bool _updated = false;
  final DocumentReference _patientRef =
      Firestore.instance.collection('patients').document(patient.login);
  _patientRef.updateData(patient.toJson()).whenComplete(() {
    _updated = true;
  }).catchError((error) {
    _updated = false;
  });
  return _updated;
}
