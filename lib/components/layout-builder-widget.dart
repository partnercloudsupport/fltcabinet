import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'CabinetTitle.dart';

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
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: new CabinetTitle(title)),
              new Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                height: 120.0, child: new Text(contenu),),
            ]),
      ));
    });
  }
}
