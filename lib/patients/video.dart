import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart' as utils;

_takeVideo() async {
  File img = await ImagePicker.pickImage(source: ImageSource.camera);
  print(img.toString());
}

Widget video() {
  return Scaffold(
    body: new Container(),
    floatingActionButton: new FloatingActionButton(
      backgroundColor: utils.getColorGlobal(),
      onPressed: _takeVideo,
      child: new Icon(Icons.videocam,),
    ),
  );
}