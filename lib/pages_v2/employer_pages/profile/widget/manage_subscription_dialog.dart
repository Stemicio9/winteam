import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';

class ManageSubscriptionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: getPadding(top: 15, bottom: 15),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: background),
                  child: Text(
                    'Avviso',
                    textAlign: TextAlign.center,
                    style: AppStyle.txtMontserratSemiBoldWhite22,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: getPadding(top: 25, bottom: 25, left: 15, right: 15),
                  child: Column(
                    children: [
                      Wrap(
                          alignment: WrapAlignment.start,
                          children: [
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
                )
              ],
            ),
          ),
          Padding(
            padding: getPadding(top: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                BACK,
                style: AppStyle.txtMontserratSemiBoldWhiteUnderline22,
              ),
            ),
          )
        ],
      ),
    );
  }
}
