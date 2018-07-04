import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;

class Inscription extends StatefulWidget {
  static const String routeName = '/inscription';

  @override
  State<StatefulWidget> createState() {
    return InscriptionState();
  }
}

class InscriptionState extends State<StatefulWidget> {
  final List<String> items = List<String>.generate(200, (index) {
    if (index % 2 == 0) {
      return 'Yes at $index';
    } else {
      return '$index refused.';
    }
  });
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: utils.getColorGlobal(),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                items.removeAt(index);
                Scaffold.of(context).showSnackBar(SnackBar(
                      content: new Text('$item remoeved'),
                    ));
              },
              child: new ListTile(
                title: new Text('Numéro $index'),
                subtitle: new Text('${items[index]}'),
              ),
              background: new Container(color: utils.getColorGlobal()),
              movementDuration: const Duration(milliseconds: 100),
            );
          },
        ),
      ),
    );
  }
}
