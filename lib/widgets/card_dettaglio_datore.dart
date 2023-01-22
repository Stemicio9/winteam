import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/entities/annunci_entity.dart';
import 'package:winteam/widgets/card_annuncio.dart';
import 'package:winteam/widgets/texts.dart';




class CardDettaglioDatore extends StatelessWidget {

  final AnnunciEntity annuncio;

  CardDettaglioDatore({required this.annuncio});


  @override
  Widget build(BuildContext context) {



    return Card(
        margin: EdgeInsets.all(10),
        elevation: 10,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(margin: EdgeInsets.only(top: 10)),

                ListTile(
                  title: Column(
                    children: [
                      Texth5(testo: annuncio.skill?.name ?? "" ,color: Colors.black,),

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
                    backgroundColor: annuncio.advertisementStatus == "CHIUSO" ? verdeopaco : annuncio.advertisementStatus ==
                        "ATTIVO" ? rossoopaco : annuncio.advertisementStatus == 'STORICO' ? giallo : Colors
                        .white,
                    label: Text(
                      annuncio.advertisementStatus,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Container(padding: EdgeInsets.only(top: 20),),

                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      iconaConTitoloDettaglio(
                          Icon(Icons.today_outlined, color: giallo, size: 30,), annuncio.date.toString()),
                      iconaConTitoloDettaglio(
                          Icon(Icons.location_on_outlined, color: giallo,size: 30,), '5 Km'),
                      iconaConTitoloDettaglio(
                          Icon(Icons.timer_outlined, color: giallo,size: 30,), annuncio.hourSlot),
                      iconaConTitoloDettaglio(
                          Icon(Icons.euro_symbol_outlined, color: giallo,size: 30,), annuncio.payment + "€"),

                    ],
                  ),
                ),

                Container(padding: EdgeInsets.only(top: 10),),

                Row(
                  children: [
                    Icon(Icons.speaker_notes, color: giallo,),
                    Container(padding: EdgeInsets.only(right: 7),),
                    Text('Descrizione', style: TextStyle(color: azzurroscuro,fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),
                Container(padding: EdgeInsets.only(top: 8),),

                Texth5(
                  testo: annuncio.description ?? "Nessuna descrizione inserita",
                  color: Colors.black,
                ),

                Container(padding: EdgeInsets.only(top: 15),),

              ],
            )
        )


    );
  }

}



