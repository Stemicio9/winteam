import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';

class CancelButton extends StatelessWidget{
  final double paddingTop; //55
  final Function onTap;

  const CancelButton({
    Key? key,
    this.paddingTop = 55,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: getPadding(
          top: paddingTop,
        ),
        child: ActionButtonV2(
            text:CANCEL,
            action:onTap,
            maxWidth:330,
            color:lightGrey,
            textColor:black,
            margin:0
        )
    );
  }

}