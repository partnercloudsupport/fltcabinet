import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  final DecorationImage uri;
  final String title;

  Header(this.uri, {this.title});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    print(screenSize);
    return new Container(
        foregroundDecoration: BoxDecoration(image: uri),);
        // child: new Text(title??title));
  }
}
