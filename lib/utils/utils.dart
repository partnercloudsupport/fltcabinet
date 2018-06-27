import 'package:flutter/material.dart';

Color colorGlobal() {
  return new Color.fromRGBO(3, 175, 128, 1.0);
}

Color colorGlobalConst() {
  return Color.fromRGBO(3, 175, 128, 1.0);
}

Color getColorWhite() {
  return new Color.fromRGBO(255, 255, 255, 1.0);
}

Color colorWhiteConst() {
  return const Color.fromRGBO(255, 255, 255, 1.0);
}

TextStyle getMyStyle() {
  return new TextStyle(
    fontFamily: 'Arial',
    fontSize: 15.0,
    color: getColorWhite(),
  );
}

TextStyle getMyStyleGlobal() {
  return new TextStyle(
    fontFamily: 'Arial',
    fontSize: 15.0,
    color: colorGlobal(),
  );
}
