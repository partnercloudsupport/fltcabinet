import 'package:flutter/material.dart';

Color get colorBase {
  return new Color.fromRGBO(3, 175, 128, 1.0);
}

Color get colorGlobal {
  return new Color.fromRGBO(3, 175, 128, 1.0);
}

Color get colorGlobalConst {
  return Color.fromRGBO(3, 175, 128, 1.0);
}

Color get colorWhite {
  return new Color.fromRGBO(255, 255, 255, 1.0);
}

TextStyle get myStyle {
  return new TextStyle(
    fontFamily: 'Arial',
    fontSize: 15.0,
    color: colorWhite,
  );
}

TextStyle get myStyleTitle {
  return TextStyle(
    fontFamily: 'Arial',
    fontSize: 15.0,
    color: colorBase
  );
}

TextStyle get myStyleGlobal {
  return new TextStyle(
    fontFamily: 'Arial',
    fontSize: 15.0,
    color: colorGlobal,
  );
}

TextStyle get styleWhite {
  return new TextStyle(
    color: colorWhite,
  );
}

double get widthInput {
  return 300.0;
}

double get widthLabel {
  return 80.0;
}

double get heightInput {
  return 55.0;

}