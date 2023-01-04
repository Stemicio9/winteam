import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class CreateAdsDescription extends StatelessWidget {
  final double paddingLeft; //20
  final double paddingRight; //20

  final double paddingTop; //30


  final double customImageViewHeight; //26
  final double customImageViewWidth; //26

  final TextEditingController descriptionController;

  final dynamic descriptionValidator;

  CreateAdsDescription({
    Key? key,

    this.paddingTop = 30,
    this.paddingLeft = 20,
    this.paddingRight = 20,
    this.customImageViewHeight = 26,
    this.customImageViewWidth = 26,
    required this.descriptionController,
    this.descriptionValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
          top: paddingTop, right: paddingRight, left: paddingLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ADS_DESCRIPTION,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratSemiBold24,
          ),


          InputsV2Widget(
            paddingLeft: 0,
            paddingRight: 0,
            hinttext: DESCRIPTION,
            controller: descriptionController,
            validator: descriptionValidator,
            multiline: true,
            maxLine: 8,
            elevation: 5,
            borderRadius: 5,
            contentPaddingRight: 20,
          ),
        ],
      ),
    );
  }
}
