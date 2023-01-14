import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class ProfileSkill extends StatelessWidget{
  final double paddingLeft; //35
  final double paddingRight; //35
  final double paddingTop; //55
  final double customImageViewHeight; //26
  final double customImageViewWidth; //26
  final double getPaddingTop; //24
  final double getVerticalSizeHeight; //26
  final double getHorizontalSizeWidth; //26
  final double getPaddingSkillTop; //12
  final double getPaddingSkillBottom; //12
  final double getPaddingSkillLeft; //16

  final List<SkillEntity> mansioni;


  const ProfileSkill({Key? key, this.paddingRight = 35,
    this.paddingTop = 55, this.paddingLeft = 35,
    this.getPaddingTop = 24, this.customImageViewHeight = 26,
    this.customImageViewWidth = 26, this.getPaddingSkillBottom = 12,
    this.getPaddingSkillTop = 12, this.getPaddingSkillLeft= 16,
    this.getVerticalSizeHeight = 26, this.getHorizontalSizeWidth = 26,
    required this.mansioni
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: getPadding(
        left: paddingLeft,
        right: paddingRight,
        top: paddingTop
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            MANSIONI,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratSemiBold24,
          ),
          Padding(
            padding: getPadding(
              top: getPaddingTop,
            ),
            child: Column(
              children: mansioni.map((e) => mansione(e)).toList(),
            )
          ),
        ],
      ),
    );
  }

  Widget mansione(SkillEntity mansione){
    return Row(
      children: [
        CustomImageView(
          svgPath: mansione.imageLink,
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
            mansione.name ?? 'Mansione Test',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratRegular20,
          ),
        ),
      ],
    );
  }

}