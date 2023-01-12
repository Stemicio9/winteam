import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/worker_pages/profile/widgets/cancel_button.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/action_buttons_v2.dart';
import 'package:winteam/widgets_v2/dialog_card.dart';

class LogoutDialog extends StatelessWidget {
  final cancelOnTap;
  final confirmOnTap;

  LogoutDialog({required this.cancelOnTap, required this.confirmOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DialogCard(
            cardTitle: LOGOUT,
            child: Column(
              children: [
                Text(
                  'Sei sicuro di voler effettuare la disconnessione dal tuo profilo?',
                  style: AppStyle.txtMontserratRegular20,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
              padding: getPadding(top: 55),
              child: ActionButtonV2(
                  action: confirmOnTap,
                  text: CONFIRM,
                  color: background,
                  maxWidth: MediaQuery.of(context).size.width,
                  textColor: white)
          ),
          CancelButton(
              paddingTop: 20,
              paddingLeft: 0,
              paddingRight: 0,
              maxWidth: MediaQuery.of(context).size.width,
              onTap: cancelOnTap),
        ],
      ),
    );
  }
}
