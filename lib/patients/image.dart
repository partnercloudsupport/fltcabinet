import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cabinet/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

File img;
_takePhoto() async {
  img = await ImagePicker.pickImage(source: ImageSource.camera);
}

Widget image() {
  return Scaffold(
    body: new Container(
      child: new Center(
        child: img == null ? new Text('Prendre photo') : new Image.file(img),
      ),
    ),
    floatingActionButton: new FloatingActionButton(
      backgroundColor: utils.colorGlobal(),
      onPressed: _takePhoto,
      child: new Icon(Icons.add_a_photo),
    ),
  );
}
