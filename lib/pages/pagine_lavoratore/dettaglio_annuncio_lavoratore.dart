import 'package:flutter/material.dart';
import 'package:winteam/widgets/appbars.dart';

class DettaglioAnnuncioLavoratore extends StatefulWidget{
  @override
  State<DettaglioAnnuncioLavoratore> createState() => DettaglioAnnuncioLavoratoreState();

}


class DettaglioAnnuncioLavoratoreState extends State<DettaglioAnnuncioLavoratore>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSenzaActions(context, 'Dettaglio'),
      body: Center(
        child: Text('Dettaglio annuncio'),
      )
    );
  }

}