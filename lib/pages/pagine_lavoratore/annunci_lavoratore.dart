import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/widgets/action_buttons.dart';
import 'package:winteam/widgets/card_annuncio.dart';
import 'package:winteam/widgets/chips.dart';import 'package:winteam/widgets/drawerWidget.dart';

class AnnunciLavoratore extends StatefulWidget {
  @override
  State<AnnunciLavoratore> createState() => AnnunciLavoratoreState();
}

class AnnunciLavoratoreState extends State<AnnunciLavoratore>{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: appbarConAction('Annunci', context),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
              ),

              ActionButtonFiltri('Filtri',context, (){Navigator.pushNamed(context, RouteConstants.filtriAnnunciLavoratore);}, 80, Icons.tune_rounded),

              Container(
                margin: EdgeInsets.only(bottom: 20),

              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ChipsWidget()
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 15),
              ),

              CardAnnuncioLavoratore(context,'ATTIVO'),
              CardAnnuncioLavoratore(context,'STORICO'),
              CardAnnuncioLavoratore(context,'CHIUSO'),
              CardAnnuncioLavoratore(context,'ATTIVO'),
              CardAnnuncioLavoratore(context,'CHIUSO'),
              CardAnnuncioLavoratore(context,'STORICO'),
              CardAnnuncioLavoratore(context,'ATTIVO'),


            ],

          ),
        ),
      ),

    );
  }

}