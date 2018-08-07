import 'package:flutter/widgets.dart';

class CabinetTitle extends StatelessWidget {
  final String title;
  final double fontsize;

  CabinetTitle(this.title, {this.fontsize});

  @override
  Widget build(BuildContext context) {
    return new Text(
      title,
      style: new TextStyle(
        fontSize: fontsize != null ? fontsize : 18.0,
        
      ),
    );
  }
}
