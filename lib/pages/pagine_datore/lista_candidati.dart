import 'package:flutter/material.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/card_candidato.dart';

class ListaCandidati extends StatefulWidget{
  @override
  State<ListaCandidati> createState() => ListaCandidatiState();
}

class ListaCandidatiState extends State<ListaCandidati> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSenzaActions(context, 'Lista candidati'),
      body: SingleChildScrollView(
          child: Column(
            children: [
              CardCandidato(),
              CardCandidato(),
              CardCandidato(),
              CardCandidato(),
            ],
          )
      ),
    );
  }

}