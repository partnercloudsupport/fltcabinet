import 'package:flutter/widgets.dart';
import '../utils/utils.dart' as utils;
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    print(screenSize);
    return new Container(
      child: Image.asset('assets/images/header.jpg', color: utils.colorBase,),
    );
  }
}