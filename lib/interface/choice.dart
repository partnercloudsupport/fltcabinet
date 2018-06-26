import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

List<Choice> choices = const <Choice>[
  const Choice(title: 'Photo', icon: Icons.camera_alt),
  const Choice(title: 'Vidéo', icon: Icons.videocam)
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Text(choice.title),
          new Icon(choice.icon),
        ],
      ),
    );
  }
}
