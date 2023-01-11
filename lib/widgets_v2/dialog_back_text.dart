import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';

class DialogBackText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 55),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text(
          BACK,
          style: AppStyle.txtMontserratSemiBoldWhiteUnderline22,
        ),
      ),
    );
  }

}