import 'package:flutter/material.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class ProfileDescriptionEdit extends StatelessWidget {
  final double paddingLeft; //35
  final double paddingTop; //55
  final double horizontalSize; //310
  final double getMarginTop; //15
  final String description;
  final String hintText;
  final dynamic validator;

  final TextEditingController descriptionTextController;

  ProfileDescriptionEdit(
      {Key? key,
      this.validator,
      this.paddingTop = 55,
      this.paddingLeft = 35,
      this.getMarginTop = 15,
      required this.description,
      this.horizontalSize = 310,
      required this.descriptionTextController,
      required hinttext})
      : hintText = hinttext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: getPadding(
        top: paddingTop,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: getPadding(left: paddingLeft),
            child: Text(
              description,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtMontserratSemiBold24,
            ),
          ),
          Container(
            padding: getPadding(top: getMarginTop),
            child: InputsV2Widget(
              paddingLeft: 35,
              paddingRight: 35,
              hinttext: hintText,
              controller: descriptionTextController,
              validator: validator,
              multiline: true,
              maxLine: 8,
              elevation: 5,
              borderRadius: 5,
              contentPaddingRight: 20,
            ),
          )
        ],
      ),
    );
  }
}

String? defaultValidator(String? text) {
  return "";
}
