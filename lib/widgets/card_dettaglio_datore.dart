import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/widgets/card_annuncio.dart';
import 'package:winteam/widgets/texts.dart';

Widget CardDettaglioDatore(String stato){
  return Card(
    margin: EdgeInsets.all(10),
    elevation: 10,
    child: Column(
      children: [
        Container(margin: EdgeInsets.only(top: 10)),

        ListTile(
          title: Column(
            children: [
              Texth5(testo:'Nessuna skill inserita',color: Colors.black,),
              Container(padding: EdgeInsets.only(bottom: 10),),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: azzurroscuro,
                      width: 2
                  ),
                  shape: BoxShape.rectangle,
                  image: const DecorationImage(
                      image: AssetImage('assets/images/profiledefault.jpeg'),
                      fit: BoxFit.fill
                  ),
                ),
              ),
            ],
          ),
          trailing: Chip(
            backgroundColor: stato == "CHIUSO" ? verdeopaco : stato ==
                "ATTIVO" ? rossoopaco : stato == 'STORICO' ? giallo : Colors
                .white,
            label: Text(
              stato,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),


        Container(padding: EdgeInsets.only(top: 20),),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(margin: EdgeInsets.only(right: 1)),

            iconaConTitoloDettaglio(
                Icon(Icons.today_outlined, color: giallo, size: 30,), '04/10'),
            iconaConTitoloDettaglio(
                Icon(Icons.location_on_outlined, color: giallo,size: 30,), '5 Km'),
            iconaConTitoloDettaglio(
                Icon(Icons.timer_outlined, color: giallo,size: 30,), '19:00'),
            iconaConTitoloDettaglio(
                Icon(Icons.euro_symbol_outlined, color: giallo,size: 30,), '120 €'),

            Container(margin: EdgeInsets.only(left: 1)),
          ],
        ),

        Container(padding: EdgeInsets.only(top: 20),),

        Container(
          margin: EdgeInsets.only(right: 15,left: 15),
          child: Texth3(testo: 'Testo di prova insensatamente troppo lungo solo per vedere come si riempie la card egg sostanzialmente allora nel senso ', color: Colors.black,),
        ),

        Container(padding: EdgeInsets.only(top: 15),),





      ],
    )


    );

}