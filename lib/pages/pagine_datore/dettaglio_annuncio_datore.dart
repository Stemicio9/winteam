import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/card_dettaglio_datore.dart';
import 'package:winteam/widgets/texts.dart';

class DettaglioAnnuncioDatore extends StatefulWidget{
  @override
  State<DettaglioAnnuncioDatore> createState() => DettaglioAnnuncioDatoreState();

}


class DettaglioAnnuncioDatoreState extends State<DettaglioAnnuncioDatore>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarSenzaActions(context, 'Dettaglio annuncio'),
        body: Column(
          children: [
            Container(padding: EdgeInsets.only(top: 20),),

            CardDettaglioDatore('ATTIVO'),

            Container(padding: EdgeInsets.only(top: 30),),

            ActionButton('9 candidati', context, (){Navigator.pushNamed(context, RouteConstants.listaCandidati);}, 200, azzurroscuro, Colors.white),

            Container(padding: EdgeInsets.only(top: 30),),

            ActionButton('Cancella annuncio', context, (){showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    title: Texth3(
                      testo:'Elimini definitivamente l\'annuncio?',
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
                200,
                rossoopaco,
                Colors.white),

          ],
        )
    );
  }
}