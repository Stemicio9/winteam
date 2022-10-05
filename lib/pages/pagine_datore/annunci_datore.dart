import 'package:flutter/material.dart';
import 'package:winteam/widgets/card_annuncio.dart';
import 'package:winteam/widgets/chipsDatore.dart';import 'package:winteam/widgets/drawerWidget.dart';

class AnnunciDatore extends StatefulWidget {
  @override
  State<AnnunciDatore> createState() => AnnunciDatoreState();
}

class AnnunciDatoreState extends State<AnnunciDatore>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(bottom: 20),

              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ChipsDatoreWidget()
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 15),
              ),

              CardAnnuncioDatore(context,'ATTIVO'),
              CardAnnuncioDatore(context,'STORICO'),
              CardAnnuncioDatore(context,'CHIUSO'),
              CardAnnuncioDatore(context,'ATTIVO'),
              CardAnnuncioDatore(context,'CHIUSO'),
              CardAnnuncioDatore(context,'STORICO'),
              CardAnnuncioDatore(context,'ATTIVO'),


            ],

          ),
        ),
      ),

    );
  }

}