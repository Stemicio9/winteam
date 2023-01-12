import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/dialog_back_text.dart';
import 'package:winteam/widgets_v2/dialog_card.dart';

class AdsPublishedDialog extends StatelessWidget{

  final onTap;

  AdsPublishedDialog({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DialogCard(
              cardTitle: NOTICE,
              child: Column(
                children: [
                  Text(
                    'Il tuo annuncio è stato pubblicato con successo!',
                    style: AppStyle.txtMontserratRegular20,
                    textAlign: TextAlign.center,
                  ),

                  Padding(
                    padding: getPadding(top: 20),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgTickSuccess,
                      height: 50,
                      width: 50,
                    ),
                  )
                ],
              )
          ),

          Padding(
            padding: getPadding(top: 30),
            child: ActionButtonV2(
                action: onTap,
                text: VIEW_ADS,
                color: background,
                maxWidth: MediaQuery.of(context).size.width,
                textColor: white
            ),
          ),

          Padding(
            padding: getPadding(top: 55),
            child: GestureDetector(
              onTap: () {Navigator.pop(context);},
              child: Text(
                'Crea un altro annuncio',
                style: AppStyle.txtMontserratSemiBoldWhiteUnderline22,

              ),
            )
          ),

        ],
      ),
    );
  }

}