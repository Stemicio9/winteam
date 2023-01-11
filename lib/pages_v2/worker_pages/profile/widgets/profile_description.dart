import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';

class ProfileDescription extends StatelessWidget{

  final double padddingLeft; //35
  final double paddingRight; //35
  final double padddingTop; //55
  final double getMarginTop; //15
  final String description;
  final String title;



  const ProfileDescription({Key? key, this.paddingRight = 35,
    this.padddingTop = 55, this.padddingLeft = 35,
    this.getMarginTop = 15,required this.description,
    required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: getPadding(
        left: padddingLeft,
        right: paddingRight,
        top: padddingTop
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtMontserratSemiBold24,
            ),

          Container(
            width: getHorizontalSize(
                MediaQuery.of(context).size.width,
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