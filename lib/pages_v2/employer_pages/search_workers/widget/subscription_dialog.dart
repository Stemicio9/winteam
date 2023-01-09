import 'package:flutter/material.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/dialog_back_text.dart';
import 'package:winteam/widgets_v2/dialog_card.dart';

class SubscriptionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DialogCard(
            cardTitle: 'Avviso',
            child: Text(
              'La tipologia di piano di cui disponi non ti permette di visualizzare le informazioni relative ai profili ricercati',
              style: AppStyle.txtMontserratRegular20,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: getPadding(top: 30),
            child: DialogCard(
              cardTitle: 'Aggiorna il tuo piano',
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
                          ' Ricerca dipendenti',
                          style: AppStyle.txtMontserratSemiBoldBlack20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          DialogBackText()
        ],
      ),
    );
  }
}
