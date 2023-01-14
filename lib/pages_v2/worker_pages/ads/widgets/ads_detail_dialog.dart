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

class AdsDetailDialog extends StatelessWidget {
  final bool isApplicantDialog;
  final confirmOnTap;

  const AdsDetailDialog(
      {super.key, this.isApplicantDialog = false, this.confirmOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: getPadding(left: 20, right: 20),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !isApplicantDialog
                ?  isNotApplicant() : isApplicant(context),
            DialogBackText()
          ],
        ),
    );
  }

  Widget isApplicant(context){
    return Column(
      children: [
        DialogCard(
          cardTitle: NOTICE,
          child:
              Text(
                'Sei sicuro di voler annullare la tua candidatura?',
                style: AppStyle.txtMontserratRegular20,
                textAlign: TextAlign.center,
              ),
        ),
        Padding(
          padding: getPadding(top: 55),
          child: ActionButtonV2(
              action: confirmOnTap,
              text: CONFIRM,
              color: background,
              maxWidth: MediaQuery.of(context).size.width,
              textColor: white),
        ),
      ],
    );



  }

  Widget isNotApplicant(){
    return DialogCard(
      cardTitle: NOTICE,
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
    );
  }

}
