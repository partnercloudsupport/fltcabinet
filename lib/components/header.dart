import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  final DecorationImage uriImage;
  final String title;

  Header(this.uriImage, {this.title});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    print(screenSize);
    return new Container(
        foregroundDecoration: BoxDecoration(image: uriImage),);
        // child: new Text(title??title));
  }
}
