import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/card_dettaglio_datore.dart';
import 'package:winteam/widgets/texts.dart';

import '../../widgets/Expandable_fab.dart';

class DettaglioAnnuncioDatore extends StatefulWidget{
  @override
  State<DettaglioAnnuncioDatore> createState() => DettaglioAnnuncioDatoreState();

}


class DettaglioAnnuncioDatoreState extends State<DettaglioAnnuncioDatore>{

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

            CardDettaglioDatore('ATTIVO'),

            Container(padding: EdgeInsets.only(top: 20),),

            ActionButton('9 candidati', context, (){Navigator.pushNamed(context, RouteConstants.listaCandidati);}, 250, azzurroscuro, Colors.white),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom:25,right: 25),
          child: ExpandableFab(
              distance: 90.0,
              children: [
                ActionButtonExpandable(
                  onPressed: () {Navigator.pushNamed(context, RouteConstants.aggiungiAnnuncio);},
                  icon:  Icon(Icons.add),
                  color: azzurroscuro,
                ),

                ActionButtonExpandable(
                  onPressed: (){showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(
                            title: Texth3(
                              testo:'Eliminare definitivamente l\'annuncio?',
                              color: Colors.black,
                            ),

                            actions: <Widget>[
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(80.0)),
                                    side: BorderSide(
                                        width: 2,
                                        color: azzurroscuro),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Annulla',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: azzurroscuro
                                    ),
                                  )
                              ),
                              MaterialButton(
                                  onPressed: () {Navigator.pop(context);},
                                  color: rossoopaco,
                                  //   padding: EdgeInsets.all(10),

                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80.0)),
                                  child: Text(
                                    'Elimina',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white
                                    ),
                                  )
                              ),

                            ],
                          )
                  );},
                  icon:  Icon(Icons.delete_outline_rounded),
                  color: Colors.red,
                ),
                ActionButtonExpandable(
                  onPressed: () => _showAction(context, 2),
                  icon:  Icon(Icons.edit),
                  color: giallo,
                ),
              ]
          )
        )

    );
  }
}