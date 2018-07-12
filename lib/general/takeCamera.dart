import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(new TakeCamera());

class TakeCamera extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TakeCameraState();
}

class TakeCameraState extends State<TakeCamera> {
  File image;
  _takeImage() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = img;
    });
  }

  // _loadImage() async {
  //   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     image = img;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: new Text('Take image'),
      //   elevation: 0.0,
      // ),
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/medecin.png'),
          ),
          Center(
            child: image == null
                ? new Text('data')
                : new Image.file(
                    image,
                    width: 300.0,
                    height: 300.0,
                    scale: 1.0,
                  ),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add_a_photo),
        onPressed: _takeImage,
      ),
    );
  }
}
