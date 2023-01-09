import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';

class SubscriptionDialog extends StatelessWidget {
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
                  child: Text(
                    'La tipologia di piano di cui disponi non ti permette di visualizzare le informazioni relative ai profili ricercati',
                    style: AppStyle.txtMontserratRegular20,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: getPadding(top: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                      'Aggiorna il tuo piano',
                      textAlign: TextAlign.center,
                      style: AppStyle.txtMontserratSemiBoldWhite22,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        getPadding(top: 25, bottom: 25, left: 15, right: 15),
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
                  )
                ],
              ),
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
