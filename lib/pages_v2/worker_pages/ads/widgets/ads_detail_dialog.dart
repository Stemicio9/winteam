import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/dialog_back_text.dart';
import 'package:winteam/widgets_v2/dialog_card.dart';

class AdsDetailDialog extends StatelessWidget {
  const AdsDetailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DialogCard(
            cardTitle: 'Avviso',
            child: Column(
              children: [
                Text(
                  'La tua candidatura è avvenuta con successo!',
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
            ),
          ),
          DialogBackText()
        ],
      ),
    );
  }
}
