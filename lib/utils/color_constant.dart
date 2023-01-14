import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray100 = fromHex('#d9d9d9');

  static Color blueGray800 = fromHex('#223d64');

  static Color black900 = fromHex('#000000');

  static Color whiteA70021 = fromHex('#21ffffff');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigoA200 = fromHex('#3366BB');

  static Color greyA500 = fromHex('#9B9B9B');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
