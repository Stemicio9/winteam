import 'package:flutter/material.dart';
import 'package:winteam/utils/color_constant.dart';
import 'package:winteam/utils/size_utils.dart';

class AppDecoration {

  static BoxDecoration get fillWhiteA700 => BoxDecoration(
    color: ColorConstant.whiteA700,
  );

  static BoxDecoration get outlineWhiteA700 => BoxDecoration(
    color: ColorConstant.blueGray100,
    border: Border.all(
      color: ColorConstant.whiteA700,
      width: getHorizontalSize(
        7.00,
      ),
    ),
  );

  static BoxDecoration get outlineWhiteA70021 => BoxDecoration(
    color: ColorConstant.whiteA700,
    boxShadow: [
      BoxShadow(
        color: ColorConstant.whiteA70021,
        spreadRadius: getHorizontalSize(
          2.00,
        ),
        blurRadius: getHorizontalSize(
          2.00,
        ),
        offset: Offset(
          0,
          0,
        ),
      ),
    ],
  );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder77 = BorderRadius.circular(
    getHorizontalSize(
      77.00,
    ),
  );

  static BorderRadius circleBorder70 = BorderRadius.circular(
    getHorizontalSize(
      70.00,
    ),
  );

  static BorderRadius circleBorder83 = BorderRadius.circular(
    getHorizontalSize(
      83.00,
    ),
  );

  static BorderRadius circleBorder22 = BorderRadius.circular(
    getHorizontalSize(
      22.00,
    ),
  );
}

