import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

Future<String> signInWithGoogle() async {
  GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication gSA = await googleUser.authentication;

  FirebaseUser _user = await _auth.signInWithGoogle(
    accessToken: gSA.accessToken,
    idToken: gSA.idToken,
  );

  return _user.displayName;
}

void signOutWithGoogle() {
  _googleSignIn.signOut();
}