import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CabinetIcon {
  static final CabinetIcon _singleton = new CabinetIcon._internal();
  CabinetIcon._internal();

  factory CabinetIcon() => _singleton;

  static const IconData logOn = const IconData(
    0xe890,
    fontFamily: 'MaterialIcons',
  );
  static const IconData arrow =
      const IconData(0xe315, fontFamily: 'MaterialIcons');
  static const IconData show =
      const IconData(0xe8f4, fontFamily: 'MaterialIcons');
  static const IconData hide =
      const IconData(0xe8f5, fontFamily: 'MaterialIcons');
  static const IconData home = const IconData(0xe85d,
      fontFamily: 'MaterialIcons', matchTextDirection: true);
  static const IconData calendar =
      const IconData(0xe935, fontFamily: 'MaterialIcons');
  static const IconData location =
      const IconData(0xe0c8, fontFamily: 'MaterialIcons');
  static const IconData account =
      const IconData(0xe853, fontFamily: 'MaterialIcons');
  static const IconData subscribe =
      const IconData(0xe064, fontFamily: 'MaterialIcons');
}
