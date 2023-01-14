import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/divider_v2.dart';

class AdsDetailSkill extends StatelessWidget {
  final skillIcon;
  final double imageWidth; // 90
  final double imageHeight; // 90
  final double chipsPaddingTop; // 10
  final double chipsPaddingBottom; // 10
  final double chipsPaddingLeft; // 20
  final double chipsPaddingRight; // 20
  final double columnPadding; // 50
  final double textPadding; // 10
  final double dividerPadding; // 20


  final String skillName;
  final String price;
  final String message;
  final String state;
  final Color statusColor;
  final bool isVisible;

  AdsDetailSkill({
    required this.skillIcon,
    this.imageHeight = 90,
    this.imageWidth = 90,
    required this.skillName,
    required this.price,
    this.isVisible = false,
    this.statusColor = Colors.redAccent,
    this.chipsPaddingBottom = 10,
    this.chipsPaddingLeft = 20,
    this.chipsPaddingRight = 20,
    this.chipsPaddingTop = 10,
    this.columnPadding = 50,
    this.textPadding = 10,
    this.dividerPadding = 20,
    this.state = '',
    this.message = '',

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:getPadding(top: columnPadding),
          child: CustomImageView(
            svgPath: skillIcon,
            height: getSize(
              imageWidth,
            ),
            width: getSize(
              imageHeight,
            ),
          ),
        ),
        Padding(
          padding: getPadding(top: textPadding),
          child: Text(
            skillName,
            style: AppStyle.txtMontserratBold28,
          ),
        ),


        Padding(
          padding: getPadding(top: textPadding),
          child: Chip(
              padding: getPadding(
                  left: chipsPaddingLeft,
                  right: chipsPaddingRight,
                  top: chipsPaddingTop,
                  bottom: chipsPaddingBottom),
              backgroundColor: green,
              label: Text(
                '$price €',
                style: AppStyle.txtMontserratBold22White,
              )),
        ),
        isVisible
            ? Padding(
                padding: getPadding(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: message,
                        style: AppStyle.txtMontserratRegular20,
                        children: <TextSpan>[
                          TextSpan(
                            text: state,
                            style: AppStyle.txtMontserratBold20,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(left: 8),
                      child: Material(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            width: 17,
                            height: 17,
                            decoration: BoxDecoration(
                              color: statusColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                    ),
                  ],
                ),
              )
            : Container(),
        Padding(
          padding: getPadding(top: dividerPadding),
          child: DividerV2(),
        ),
      ],
    );
  }
}
