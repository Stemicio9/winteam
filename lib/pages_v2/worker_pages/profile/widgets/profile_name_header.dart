


import 'package:flutter/material.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class ProfileNameHeader extends StatelessWidget {

  final double sectionHeight;
  final double widthFactor;
  final String name;
  final String description;
  final double iconWidth;  // 40
  final double iconHeight;  // 40
  final VoidCallback? onTap;
  final bool isOnlyView;

  const ProfileNameHeader({Key? key,
    this.sectionHeight = 54, this.widthFactor = 0.8,
    this.name = "", this.description = "",
    this.iconWidth = 400, this.iconHeight = 400, this.onTap,
    this.isOnlyView = false
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(

          child: Container(
            height: getVerticalSize(
             sectionHeight,
            ),
            width: MediaQuery.of(context).size.width*widthFactor,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratBold28,
                  ),
                ),
            !isOnlyView ? GestureDetector(
               onTap: onTap,
               child: Container(
                 height: getSize(
                   iconHeight,
                 ),
                 width: getSize(
                   iconWidth,
                 ),
                 child: CustomImageView(
                   radius: BorderRadius.circular(50),
                   svgPath: ImageConstant.imgArrowleft,
                        height: getSize(
                          iconHeight*0.1,
                        ),
                        width: getSize(
                          iconWidth*0.1,
                        ),
                        alignment: Alignment.topRight,
                      ),
               ),
             ) : Container(),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratRegular22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
