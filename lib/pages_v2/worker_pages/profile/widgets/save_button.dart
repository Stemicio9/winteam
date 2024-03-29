import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';

class SaveButton extends StatelessWidget {
  final double paddingTop; //20
  final Function onTap;
  final double paddingLeft; //35
  final double paddingRight; //35

  const SaveButton({
    Key? key,
    this.paddingTop = 55,
    this.paddingLeft = 35,
    this.paddingRight = 35,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            getPadding(top: paddingTop, right: paddingRight, left: paddingLeft),
        child: ActionButtonV2(
          text: SAVE,
          action: onTap,
          maxWidth: 330,
          color: background,
          textColor: white,
        ));
  }
}
