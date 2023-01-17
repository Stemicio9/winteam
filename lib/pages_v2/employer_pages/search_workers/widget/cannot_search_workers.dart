import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/pages_v2/employer_pages/search_workers/widget/subscription_dialog.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class CannotSearchWorkersWidget extends StatelessWidget {
  const CannotSearchWorkersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              barrierColor: blackDialog,
              builder: (ctx) => SubscriptionDialog());
        },
        child: Padding(
          padding: getPadding(bottom: 20, left: 20, right: 20),
          child: Column(
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgNotice,
                width: 40,
                height: 40,
              ),
              Padding(
                  padding: getPadding(top: 20),
                  child: Text(
                    'I dati relativi ai profili sottostanti sono stati nascosti perchè la tipologia del tuo abbonamento non ti permette di visualizzarli.',
                    style: AppStyle.txtMontserratRegular18,
                    textAlign: TextAlign.center,
                  )
              ),
            ],
          ),
        ));
  }
}
