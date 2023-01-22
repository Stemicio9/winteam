import 'package:flutter/material.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/divider_v2.dart';

class CannotCreateAdsWidget extends StatelessWidget {
  const CannotCreateAdsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(left: 20, right: 20,top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(bottom: 20, left: 20, right: 20),
            child: Column(
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgNotice,
                  width: 60,
                  height: 60,
                ),
                Padding(
                    padding: getPadding(top: 40,bottom: 40),
                    child: Text(
                      'La tipologia di piano di cui disponi non ti permette di effettuare la creazione di un annuncio.',
                      style: AppStyle.txtMontserratRegular20,
                      textAlign: TextAlign.center,

                    )
                ),

                DividerV2(
                  indent: 0,
                  endIndent: 0,

                ),

                Padding(
                  padding:getPadding(top: 40),
                  child: Column(
                    children: [
                      Text(
                        'Se vuoi sbloccare questa funzionalità accedi al seguente link',
                        style: AppStyle.txtMontserratRegular20,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: getPadding(top: 20),
                        child: Text(
                          'http://w1n.wepp.app.it',
                          style: AppStyle.txtMontserratRegularGrey20,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 20),
                        child: Text(
                          'e',
                          style: AppStyle.txtMontserratRegular20,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 20),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              '•  Modifica',
                              style: AppStyle.txtMontserratRegularItalic20,
                            ),
                            Text(
                              ' il',
                              style: AppStyle.txtMontserratRegular20,
                            ),
                            Text(
                              ' Tipo di abbonamento',
                              style: AppStyle.txtMontserratSemiBoldBlack20,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 20),
                        child: Text(
                          'oppure',
                          style: AppStyle.txtMontserratRegular20,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 20),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              '•  Abilita',
                              style: AppStyle.txtMontserratRegularItalic20,
                            ),
                            Text(
                              ' la funzione',
                              style: AppStyle.txtMontserratRegular20,
                            ),
                            Text(
                              ' Crea annuncio',
                              style: AppStyle.txtMontserratSemiBoldBlack20,
                            ),
                          ],
                        ),
                      ),
                    ],
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
