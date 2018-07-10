import 'package:firebase_database/firebase_database.dart';

class User {
  final String login;
  final String passwd;
  final int idProfil;

  User(this.login, this.passwd, this.idProfil);

  User.fromSnapshot(DataSnapshot snapshot)
      : login = snapshot.value["login"],
        passwd = snapshot.value['passwd'],
        idProfil = snapshot.value['idProfil'];

  toJson() {
    return {
      "login": login,
      "passwd": passwd,
      "idProfil": idProfil,
    };
  }

}
