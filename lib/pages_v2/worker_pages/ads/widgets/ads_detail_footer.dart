import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class AdsDetailFooter extends StatelessWidget{


  final String candidates;
  final onTap;
  final String text;


  AdsDetailFooter({required this.candidates, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
         candidates != '0' ? Padding(
           padding: getPadding(top: 30,right: 35,left: 35),
           child: Row(
              children: [
                Padding(
                  padding: getPadding(right: 15),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgPeople,
                    height: getSize(
                      30,
                    ),
                    width: getSize(
                      30,
                    ),
                  ),
                ),
                Text(
                  candidates == "1" ? CANDIDATE : CANDIDATES,
                  style: AppStyle.txtMontserratRegular20,
                ),

                Text(
                  candidates == "1" ? ' $candidates $PERSON' : ' $candidates $PEOPLE',
                   style: AppStyle.txtMontserratBold20,
                ),
              ],
            ),
         ) :

         Padding(
           padding: getPadding(top: 30,right: 35,left: 20),
           child: ListTile(
               leading: CustomImageView(
                 imagePath: ImageConstant.imgPeople,
                 height: getSize(
                   30,
                 ),
                 width: getSize(
                   30,
                 ),
               ),

              title: Text(
               NO_CANDIDATE,
               style: AppStyle.txtMontserratRegular20,
             ),
           ),
         ),


        Padding(
            padding: getPadding(top: 30),
            child: ActionButtonV2(
                action: onTap,
                text: text,
                color: background,
                maxWidth: 330,
                textColor: white
            ),
          )

        ],

    );
  }

}