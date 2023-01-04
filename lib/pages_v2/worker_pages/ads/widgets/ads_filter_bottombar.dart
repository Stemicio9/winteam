import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';

class AdsFilterBottombar extends StatelessWidget{

  final onTap;

  AdsFilterBottombar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:getPadding(bottom: 30,right: 35,left: 35,top: 30),
      decoration: const BoxDecoration(
        border: Border(
         top: BorderSide(
             color: black,
             width: 0.2
         ),
        )
      ),
      child: ActionButtonV2(
                action: onTap,
                text: FILTER_APPLY,
                color: background,
                maxWidth: MediaQuery.of(context).size.width,
                textColor: white,
              ),
    );


  }

}