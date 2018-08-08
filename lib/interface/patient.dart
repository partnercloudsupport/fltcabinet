import 'package:firebase_database/firebase_database.dart';

class Patient {
  final int idProfil = 1;
  String nom;
  String prenom;
  String dateNaissance;
  String lieuNaissance;
  String login;
  String passwd;
  int crypto;
  int numeroCarte;
  String dateExpiration;
  int numeroRue;
  String libelle;
  int codePostal;
  String ville;
  String telephone;
  String email;

  Patient(
      this.nom,
      this.prenom,
      this.dateNaissance,
      this.lieuNaissance,
      this.login,
      this.passwd,
      this.crypto,
      this.numeroCarte,
      this.dateExpiration,
      this.numeroRue,
      this.libelle,
      this.codePostal,
      this.ville,
      this.telephone,
      this.email);

  Patient.fromSnapshot(DataSnapshot snapshot)
      : login = snapshot.value['login'],
        passwd = snapshot.value['passwd'];

  Patient.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        passwd = json['passwd'];

  toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'dateNaissance': dateNaissance,
      'lieuNaissance': lieuNaissance,
      'login': login,
      'passwd': passwd,
      'crypto': crypto,
      'numeroCarte': numeroCarte,
      'dateExpiration': dateExpiration,
      'numeroRue': numeroRue,
      'libelle': libelle,
      'codePostal': codePostal,
      'ville': ville,
      'telephone': telephone,
      'email': email,
      'idProfil': idProfil,
    };
  }
}
