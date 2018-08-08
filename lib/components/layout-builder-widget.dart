import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/utils.dart' as utils;

class LayoutBuilderWidget extends StatelessWidget {
  final String title;
  final dynamic contenu;

  LayoutBuilderWidget({this.title, this.contenu});

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
          child: new ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: viewportConstraints.maxHeight,
        ),
        child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                  height: 50.0,
                  child: new Text(title,
                      style: new TextStyle(color: utils.colorBase))),
              new Container(color: Colors.green, height: 120.0),
            ]),
      ));
    });
  }
}
