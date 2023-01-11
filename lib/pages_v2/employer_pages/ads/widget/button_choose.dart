import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';

class ButtonChoose extends StatelessWidget{

  final Function? choose;
  final double maxWidth;

  ButtonChoose({required this.choose, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return ActionButtonV2(
      action:choose,
      text: CHOOSE,
      color: green,
      maxWidth: maxWidth,
      textColor: white,
      isVisible: true,
      svgPath: ImageConstant.imgAssumi,
      iconWidth: 30,
      iconHeight: 30,
    );
  }

}