import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class CreateAdsPosition extends StatelessWidget {
  final double paddingLeft; //20
  final double paddingRight; //20

  final double paddingTop; //30


  final double customImageViewHeight; //26
  final double customImageViewWidth; //26

  final TextEditingController positionController;

  final dynamic positionValidator;

  CreateAdsPosition({
    Key? key,

    this.paddingTop = 30,
    this.paddingLeft = 20,
    this.paddingRight = 20,
    this.customImageViewHeight = 26,
    this.customImageViewWidth = 26,
    required this.positionController,
    this.positionValidator,
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
            PLACE,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratSemiBold24,
          ),
          InputsV2Widget(
            isPrefixIcon: true,
            prefixIcon: ImageConstant.imgMapsandflags,
            hinttext: INSERT_POSITION,
            controller: positionController,
            validator: positionValidator,
            elevation: 5,
            borderRadius: 5,
            paddingRight: 0,
            paddingLeft: 0,
            prefixIconHeight: 25,
            prefixIconWidth: 25,
          )
        ],
      ),
    );
  }
}
