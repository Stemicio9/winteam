import 'package:flutter/material.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class EmptyMessage extends StatelessWidget{

  final String text;

  EmptyMessage({required this.text});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: getPadding(top: 30),
          child: CustomImageView(
            svgPath: ImageConstant.imgEmpty,
            height: 50,
            width: 50,
          ),
        ),
        Padding(
          padding: getPadding(top: 20),
          child: Text(
            text,
            style: AppStyle.txtMontserratRegular18,
            textAlign: TextAlign.center,
          ),
        ),
      ],

    );
  }

}