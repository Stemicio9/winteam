import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';

class ProfileDescription extends StatelessWidget{

  final double padddingLeft; //35
  final double paddingRight; //35
  final double padddingTop; //55
  final double horizontalSize; //310
  final double getMarginTop; //15
  final String description;
  final String title;



  const ProfileDescription({Key? key, this.paddingRight = 35,
    this.padddingTop = 55, this.padddingLeft = 35,
    this.getMarginTop = 15,required this.description,
    this.horizontalSize = 310, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: getPadding(
        left: padddingLeft,
        right: paddingRight,
        top: padddingTop
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

        Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtMontserratSemiBold24,
            ),

          Container(
            width: getHorizontalSize(
              horizontalSize,
            ),
            margin: getMargin(
              top: getMarginTop,
            ),
            child: Text(
              description,
              maxLines: null,
              textAlign: TextAlign.left,
              style: AppStyle.txtMontserratRegular20,
            ),
          ),
        ],
      ),
    );
  }

}