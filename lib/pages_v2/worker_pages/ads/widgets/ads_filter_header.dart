import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

import '../../../../widgets_v2/divider_v2.dart';

class AdsFilterHeader extends StatelessWidget {
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final onTap;
  final onTapBack;


  AdsFilterHeader(
      {this.paddingRight = 35,
      this.paddingLeft = 35,
      this.paddingTop = 55,
      required this.onTapBack,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        top: paddingTop,
      ),
      child: Column(
        children: [
          Padding(
            padding: getPadding(left: paddingLeft, right: paddingRight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: getPadding(right: 20),
                      child: ExpandTapWidget(
                        onTap: onTapBack,
                        tapPadding: const EdgeInsets.all(20.0),
                        child:CustomImageView(
                          imagePath: ImageConstant.imgCancel,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                        ),
                      ),



                    ),
                    Text(
                      FILTERS,
                      style: AppStyle.txtMontserratSemiBoldBlack24,
                    ),
                  ],
                ),
                ActionButtonV2(
                  isVisible: true,
                  imgPath: ImageConstant.imgCancel,
                  iconHeight: 10,
                  iconWidth: 10,
                  containerHeight: 34,
                  action: onTap,
                  text: REMOVE_ALL,
                  color: white,
                  maxWidth: 150,
                  weight: FontWeight.normal,
                  textColor: black,
                  hasBorder: true,
                  borderColor: darkGrey,
                  borderWidth: 0.5,
                  maxHeight: 34,
                  fontSize: 14,
                //  suffixIcon: Icons.add,
                )
              ],
            ),
          ),
          Padding(
            padding: getPadding(top: 15),
            child: DividerV2(
              indent: 0,
              endIndent: 0,
            ),
          )
        ],
      ),
    );
  }
}
