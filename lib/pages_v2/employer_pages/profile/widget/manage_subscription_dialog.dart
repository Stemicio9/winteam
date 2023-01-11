import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/dialog_back_text.dart';
import 'package:winteam/widgets_v2/dialog_card.dart';

class ManageSubscriptionDialog extends StatelessWidget {
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
                Wrap(alignment: WrapAlignment.start, children: [
                  Text(
                    'Per accedere alla sezione',
                    style: AppStyle.txtMontserratRegular20,
                  ),
                  Text(
                    ' Gestione abbonamento',
                    style: AppStyle.txtMontserratSemiBoldBlack20,
                  ),
                  Text(
                    ' accedi al seguente link:',
                    style: AppStyle.txtMontserratRegular20,
                  ),
                ]),
                Padding(
                  padding: getPadding(top: 30),
                  child: Text(
                    'http://w1n.web.app.it',
                    style: AppStyle.txtMontserratRegularGrey20,
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
