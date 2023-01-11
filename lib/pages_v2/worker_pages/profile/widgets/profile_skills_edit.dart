import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/worker_pages/profile/data/mansione.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class ProfileSkillsEdit extends StatelessWidget {
  final double paddingLeft; //35
  final double paddingRight; //35
  final double paddingTop; //55
  final double customImageViewHeight; //26
  final double customImageViewWidth; //26
  final double getPaddingTop; //12
  final double internalPaddingTop; //12
  final double internalPaddingBottom; //12
  final Function ontap;
  final Function deleteSkill;

  final double getVerticalSizeHeight; //26
  final double customImageViewHeightClose; //22
  final double customImageViewWidthClose; //22

  final double getHorizontalSizeWidth; //26
  final double getPaddingSkillTop; //12
  final double getPaddingSkillBottom; //12
  final double getPaddingSkillLeft; //16

  final double elevation; //5
  final double borderRadius; //5

  final List<Mansione> mansioni;

  const ProfileSkillsEdit(
      {Key? key,
      this.paddingRight = 35,
      this.paddingTop = 55,
      this.paddingLeft = 35,
      this.getPaddingTop = 15,
      this.customImageViewHeight = 22,
      this.customImageViewWidth = 22,
      this.getPaddingSkillBottom = 12,
      this.getPaddingSkillTop = 12,
      this.getPaddingSkillLeft = 16,
      this.getVerticalSizeHeight = 26,
      this.getHorizontalSizeWidth = 26,
      required this.mansioni,
      this.borderRadius = 5,
      this.internalPaddingBottom = 12,
      this.internalPaddingTop = 12,
      this.elevation = 5,
      this.customImageViewHeightClose = 25,
      this.customImageViewWidthClose = 22,
      required this.ontap,
      required this.deleteSkill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: getPadding(top: paddingTop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(left: paddingLeft),
            child: Text(
              MANSIONI,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtMontserratSemiBold24,
            ),
          ),
          Padding(
              padding: getPadding(
                  top: getPaddingTop, left: paddingLeft, right: paddingRight),
              child: Column(
                children: mansioni.map((e) => mansione(e)).toList(),
              )),
          Padding(
              padding: getPadding(
                  top: getVerticalSizeHeight,
                  left: paddingLeft,
                  right: paddingRight),
              child: ActionButtonV2(
                text: ADD_SKILLS,
                action: ontap,
                maxWidth: MediaQuery.of(context).size.width,
                color: lightGrey,
                textColor: black,
                margin: 0,
                prefixIcon: Icons.add_rounded,
              ))
        ],
      ),
    );
  }

  Widget mansione(Mansione mansione) {
    return Container(
        padding: getPadding(
          top: internalPaddingTop,
          bottom: internalPaddingBottom,
        ),
        child: PhysicalModel(
            borderRadius: BorderRadius.circular(borderRadius),
            color: white,
            elevation: elevation,
            shadowColor: blackTransparent,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 6, bottom: 6, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomImageView(
                        svgPath: mansione.icon,
                        height: getVerticalSize(
                          customImageViewHeight,
                        ),
                        width: getHorizontalSize(
                          customImageViewWidth,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: getPaddingSkillLeft,
                          top: getPaddingSkillTop,
                          bottom: getPaddingSkillBottom,
                        ),
                        child: Text(
                          mansione.text,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: AppStyle.txtMontserratRegular16,
                        ),
                      ),
                    ],
                  ),
                  CustomImageView(
                    onTap: () {
                      deleteSkill(mansioni.indexOf(mansione));
                    },
                    svgPath: ImageConstant.imgClose,
                    height: getVerticalSize(
                      customImageViewHeightClose,
                    ),
                    width: getHorizontalSize(
                      customImageViewWidthClose,
                    ),
                  ),
                ],
              ),
            )));
  }
}
