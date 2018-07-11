import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

Future<FirebaseApp> get appconfig async {
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',
    options: const FirebaseOptions(
      databaseURL: 'https://cabinet-8dd74.firebaseio.com',
      apiKey: 'AIzaSyBxtWzIQtIsYexqOw9hlKZq-TbDT-gaQbY',
      googleAppID: '1:577939527966:android:e3a7d1641ebf8ef4',
    ),
  );
  return app;
}
