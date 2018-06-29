import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

class Authentifier extends StatefulWidget {
  Authentifier({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => new AuthentifierSate();
}

class AuthentifierSate extends State {
  Future<String> _message = new Future<String>.value('');
// test anonymement
// =================================================
  Future<String> _testSignInAnonymously() async {
    final FirebaseUser user = await _auth.signInAnonymously();

    assert(user != null);
    assert(user.isAnonymous);
    assert(user.isEmailVerified);
    assert(await user.getIdToken() != null);

    if (Platform.isAndroid) {
      assert(user.providerData.length == 1);
      assert(user.providerData[0].providerId == 'firebase');
      assert(user.providerData[0].uid != null);
      assert(user.providerData[0].displayName == null);
      assert(user.providerData[0].photoUrl == null);
      assert(user.providerData[0].email == null);
    }

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    return 'User sign in anonymously : $user';
  }

  // Test avec google
  // ==============================================
  Future<String> _testSignInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final FirebaseUser user = await _auth.signInWithGoogle(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    assert(user.email != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    setState(() {
      _tmpUser = currentUser;
    });

    assert(user.uid == currentUser.uid);

    return 'Authentification avec google réussit : $user';
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('widget.title'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // new Container(
          //   child: _tmpUser.email == null ? new Text('d') : new Text('data'),
          // ),
          new MaterialButton(
            child: const Text('Button Test Anonymousely'),
            onPressed: () {
              setState(() {
                _message = _testSignInAnonymously();
              });
            },
          ),
          new MaterialButton(
            child: const Text('Test Using Google'),
            onPressed: () {
              setState(() {
                _message = _testSignInWithGoogle();
              });
            },
          ),
          new FutureBuilder<String>(
            future: _message,
            initialData: 'Initial data',
            builder: (context, AsyncSnapshot<String> snapshot) {
              return new Text(
                snapshot.data ?? '',
                style: new TextStyle(color: Colors.blue),
              );
            },
          ),
        ],
      ),
    );
  }
}
