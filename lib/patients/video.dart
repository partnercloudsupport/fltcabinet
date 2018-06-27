import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cabinet/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

_takeVideo() async {
  File img = await ImagePicker.pickImage(source: ImageSource.camera);
  print(img.toString());
}

Widget video() {
  return Scaffold(
    body: new Container(),
    floatingActionButton: new FloatingActionButton(
      backgroundColor: utils.colorGlobal(),
      onPressed: _takeVideo,
      child: new Icon(Icons.videocam,),
    ),
  );
}