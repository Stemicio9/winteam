
import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class ProfileInfo extends StatelessWidget {

  final double padddingLeft; //35
  final double paddingRight; //35
  final double padddingTop; //55
  final double customImageViewHeight; //26
  final double customImageViewWidht; //26
  final double getPaddingTop; //24
  final double getVerticalSizeHeight; //26
  final double getHorizontalalSizeWidth; //26
  final double getPaddingInfoTop; //1
  final double getPaddingInfoBottom; //2
  final double getPaddingInfoLeft; //16
  final String phone;
  final String email;
  final String position;






  const ProfileInfo({Key? key, this.paddingRight = 35,
    this.padddingTop = 55, this.padddingLeft = 35,
    this.getPaddingTop = 24, this.customImageViewHeight = 26,
    this.customImageViewWidht = 26, this.getPaddingInfoBottom = 2,
    this.getPaddingInfoTop = 1, this.getPaddingInfoLeft= 16,
    this.getVerticalSizeHeight = 26, this.getHorizontalalSizeWidth = 26,
    this.email = '', this.phone = '', this.position = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: getPadding(
        left: padddingLeft,
        right: paddingRight,
        top: padddingTop,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

           Text(
              I_MIEI_DATI,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtMontserratSemiBold24,
            ),

          Container(
            padding: getPadding(
              top: getPaddingTop,
            ),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgPhonereceiversilhouette,
                  height: getSize(
                    customImageViewHeight,
                  ),
                  width: getSize(
                    customImageViewWidht,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: getPaddingInfoLeft,

                  ),
                  child: Text(
                    phone,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratRegular20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: getPaddingTop,
            ),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEmail,
                  height: getVerticalSize(
                    getVerticalSizeHeight,
                  ),
                  width: getHorizontalSize(
                    getHorizontalalSizeWidth,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: getPaddingInfoLeft,

                  ),
                  child: Text(
                    email,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratRegular20,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: getPaddingTop,
            ),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgMapsandflags,
                  height: getSize(
                    customImageViewHeight,
                  ),
                  width: getSize(
                    customImageViewWidht,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: getPaddingInfoLeft,

                  ),
                  child: Text(
                    position,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratRegular20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
