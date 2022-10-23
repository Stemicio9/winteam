import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/texts.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/card_dettaglio_datore.dart';

import '../../widgets/Expandable_fab.dart';

class DettaglioAnnuncioLavoratore extends StatefulWidget{
  @override
  State<DettaglioAnnuncioLavoratore> createState() => DettaglioAnnuncioLavoratoreState();

}


class DettaglioAnnuncioLavoratoreState extends State<DettaglioAnnuncioLavoratore>{
  static const _actionTitles = ['Create Post', 'Eliminare definitivamente l\'annuncio?', 'Modifica annuncio'];

  void _showAction(BuildContext context, int index) {

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarSenzaActions(context, 'Dettaglio annuncio'),
        body: Column(
          children: [
            Container(padding: EdgeInsets.only(top: 30),),

     //       CardDettaglioDatore(),

            Container(padding: EdgeInsets.only(top: 50),),

            ActionButton('Candidati', context, () {}, 250, azzurroscuro, Colors.white),
          ],
        ),



    );
  }
}