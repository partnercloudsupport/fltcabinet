import 'package:flutter/material.dart';

Color getColorBase(){
  return new Color.fromRGBO(3, 175, 128, 1.0);
}

Color getColorGlobal() {
  return new Color.fromRGBO(3, 175, 128, 1.0);
}

Color colorGlobalConst() {
  return Color.fromRGBO(3, 175, 128, 1.0);
}

Color getColorWhite() {
  return new Color.fromRGBO(255, 255, 255, 1.0);
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
    color: getColorGlobal(),
  );
}

TextStyle getStyleWhite() {
  return new TextStyle(
    color: getColorWhite(),
  );
}

double getWidthInput() {
  return 300.0;
}

double getHeightInput() {
  return 55.0;
}