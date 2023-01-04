import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

import '../../../../constants/colors.dart';

class ProfileInfoEdit extends StatelessWidget {
  final double paddingLeft; //35
  final double paddingTop; //55
  final double getPaddingTop; //15

  final double customImageViewHeight; //26
  final double customImageViewWidth; //26
  final String info;

  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController positionController;

  final dynamic phoneValidator;
  final dynamic emailValidator;
  final dynamic positionValidator;

  ProfileInfoEdit({
    Key? key,
    this.getPaddingTop = 15,
    this.paddingTop = 55,
    this.paddingLeft = 35,
    this.customImageViewHeight = 26,
    this.customImageViewWidth = 26,
    required this.phoneController,
    required this.emailController,
    required this.positionController,
    this.phoneValidator,
    this.emailValidator,
    this.positionValidator,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        padding: getPadding(
          left: paddingLeft,
          top: paddingTop,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                info,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtMontserratSemiBold24,
              ),
              Container(
                  padding: getPadding(top: getPaddingTop),
                  child: InputsV2Widget(
                    isPrefixIcon: true,
                    svgPath: ImageConstant.imgPhoneSvg,
                    hinttext: PHONE_PLACEHOLDER,
                    controller: phoneController,
                    validator: phoneValidator,
                    paddingLeft: 0,
                    paddingRight: 35,
                    elevation: 5,
                    borderRadius: 5,
                    prefixIconHeight: 22,
                    prefixIconWidth: 22,
                  )
              ),
              InputsV2Widget(
                isPrefixIcon: true,
                svgPath: ImageConstant.imgEmailSvg,
                hinttext: INSERT_EMAIL,
                controller: emailController,
                validator: emailValidator,
                paddingLeft: 0,
                prefixIconHeight: 16,
                prefixIconWidth: 22,
                paddingRight: 35,
                elevation: 5,
                borderRadius: 5,
              ),
              InputsV2Widget(
                prefixIconHeight: 26,
                prefixIconWidth: 19,
                isPrefixIcon: true,
                svgPath: ImageConstant.imgPosition,
                hinttext: POSITION_PLACEHOLDER,
                controller: positionController,
                validator: positionValidator,
                paddingLeft: 0,
                paddingRight: 35,
                elevation: 5,
                borderRadius: 5,
              ),
            ]));
  }
}
