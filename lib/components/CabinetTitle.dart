import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CabinetTitle extends StatelessWidget {
  final String title;
  final double fontsize;

  CabinetTitle(this.title, {this.fontsize});

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 35.5,
        width: (title.length * 12.0),
        decoration: BoxDecoration(
            color: Color.fromRGBO(3, 175, 128, 1.0),
            borderRadius: BorderRadius.all(Radius.circular(100.0))),
        alignment: Alignment.center,
        child: new Text(title,
            style: new TextStyle(
              fontSize: fontsize != null ? fontsize : 14.0,
              color: Colors.white,
            )));
  }
}
