import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  final String uri;

  Header(this.uri);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    print(screenSize);
    return new Container(
      child: Image.asset(
        uri,
      ),
    );
  }
}
