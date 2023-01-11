import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class CreateAdsPrice extends StatelessWidget {
  final double paddingLeft; //20
  final double paddingRight; //20

  final double paddingTop; //30

  final double customImageViewHeight; //26
  final double customImageViewWidth; //26

  final TextEditingController priceController;

  final dynamic priceValidator;

  CreateAdsPrice({
    Key? key,
    this.paddingTop = 30,
    this.paddingLeft = 20,
    this.paddingRight = 20,
    this.customImageViewHeight = 26,
    this.customImageViewWidth = 26,
    required this.priceController,
    this.priceValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          getPadding(top: paddingTop, right: paddingRight, left: paddingLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            COMPENSO,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratSemiBold24,
          ),
          InputsV2Widget(
            isPrefixIcon: true,
            svgPath: ImageConstant.imgMoney,
            hinttext: '€',
            controller: priceController,
            validator: priceValidator,
            elevation: 5,
            borderRadius: 5,
            paddingRight: 0,
            paddingLeft: 0,
            prefixIconHeight: 20,
            prefixIconWidth: 25,
          )
        ],
      ),
    );
  }
}
