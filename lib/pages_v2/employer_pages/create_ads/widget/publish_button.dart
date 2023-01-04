import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';

class PublishButton extends StatelessWidget{

  final onTap;

  PublishButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: getPadding(top: 40,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ActionButtonV2(
              action: onTap,
              text: POST,
              color: background,
              maxWidth: 355,
              textColor: white
          ),
        ],
      ),
    );
  }

}