import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CabinetIcon {
  static final CabinetIcon _singleton = new CabinetIcon._internal();
  CabinetIcon._internal();

  factory CabinetIcon() => _singleton;

  static const IconData account =
      const IconData(0xe853, fontFamily: 'MaterialIcons');
  static const IconData calendar =
      const IconData(0xe935, fontFamily: 'MaterialIcons');
  static const IconData home =
      const IconData(0xe429, fontFamily: 'MaterialIcons');
  static const IconData location =
      const IconData(0xe0c8, fontFamily: 'MaterialIcons');
  static const IconData photo =
      const IconData(0xe412, fontFamily: 'MaterialIcons');
  static const IconData subscribe =
      const IconData(0xe5d4, fontFamily: 'MaterialIcons');
}
