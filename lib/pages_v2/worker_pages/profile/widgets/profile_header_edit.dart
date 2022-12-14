import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class ProfileHeaderEdit extends StatelessWidget {
  final TextEditingController nameTextController;
  final TextEditingController headerDescriptionTextController;
  final dynamic nameValidator;
  final dynamic headerDescriptionValidator;
  final double getPaddingTop; //15

  const ProfileHeaderEdit({
    this.getPaddingTop = 15,
    required this.nameTextController,
    required this.headerDescriptionTextController,
    this.nameValidator,
    this.headerDescriptionValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        padding: getPadding(top: getPaddingTop),
        child: Column(
          children: [
            InputsV2Widget(
              hinttext: PROFILE_NAME_PLACEHOLDER,
              controller: nameTextController,
              validator: nameValidator,
              paddingLeft: 35,
              paddingRight: 35,
              fontSize: 22,
              textAlign: TextAlign.center,
              contentPaddingLeft: 0,
              fontHintSize: 22,
              elevation: 5,
              borderRadius: 5,
           //   isPrefixIcon: true,
            //  svgPath: ImageConstant.imgBuilding,
           //   prefixIconWidth: 35,
           //   prefixIconHeight: 35,
            ),
            InputsV2Widget(
              hinttext: PROFILE_DESCRIPTION_PLACEHOLDER,
              controller: headerDescriptionTextController,
              validator: headerDescriptionValidator,
              paddingLeft: 35,
              paddingRight: 35,
              textAlign: TextAlign.center,
              contentPaddingLeft: 0,
              fontSize: 16,
              fontHintSize: 16,
              elevation: 5,
              borderRadius: 5,
            ),
          ],
        ));
  }
}
