import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/entities/annunci_entity.dart';


Widget iconaConTitoloDettaglio(Icon icon, String testo){
  return Padding(
    padding: const EdgeInsets.only(top:10, bottom: 10),
    child: Column(
      children: [
        icon,
        const SizedBox(width: 3,),
        RichText(textAlign: TextAlign.left, text: TextSpan(text: testo,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color:
        azzurroscuro)),)
      ],
    ),
  );
}

Widget iconaConTitolo(Icon icon, String testo){
  return Padding(
    padding: const EdgeInsets.only(top:10, bottom: 10),
    child: Column(
      children: [
        icon,
        const SizedBox(width: 3,),
        RichText(textAlign: TextAlign.left, text: TextSpan(text: testo,style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color:
        azzurroscuro)),)
      ],
    ),
  );
}








Widget CardAnnuncioLavoratore(BuildContext context, String stato){
  return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
          children: [

            Container(margin: EdgeInsets.only(top: 10)),

            Container(
                width: double.infinity,
                child: Row(
                  children: [

                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: azzurroscuro,
                            width: 1
                        ),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage('assets/images/avatar_image.png'),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text( 'Nome attività', style:  TextStyle(color: azzurroscuro, fontSize: 16),),
                          Text('Città', textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    Chip(
                      backgroundColor: stato == "ATTIVO" ? Colors.green : stato == "CHIUSO" ? rossoopaco : stato == 'STORICO' ? giallo : Colors.white,
                      label: Text(
                        stato,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
            ),
            Padding(padding: EdgeInsets.only(top: 10)),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  iconaConTitolo(Icon(Icons.today_outlined,color: giallo), '04/10'),
                  iconaConTitolo(Icon(Icons.location_on_outlined,color: giallo),'5 Km'),
                  iconaConTitolo(Icon(Icons.timer_outlined,color: giallo), '19:00'),
                  iconaConTitolo(Icon(Icons.euro_symbol_outlined,color: giallo), '120'),

                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/logo.png',width: 70,height: 70),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, RouteConstants.dettaglioAnnuncioLavoratore);},
                  child: Icon(Icons.info_rounded, color: giallo,size: 35,),

                )
              ],

            )
          ],
        )
      )
  );
}



List<String> annunciStatusList = ["active", "accepted", "history", "current"];


class CardAnnuncioDatore extends StatelessWidget{



  final AnnunciEntity annuncio;


  CardAnnuncioDatore({required this.annuncio});


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

                Container(
                    width: double.infinity,
                    child: Row(
                      children: [

                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: azzurroscuro,
                                width: 1
                            ),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage('assets/images/avatar_image.png'),
                                fit: BoxFit.fill
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Container(
                                width: 150,
                                child: Text("TESTO DI PROVA",
                                style:  TextStyle(color: azzurroscuro, fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),

                              )
                         //     Text(annuncio.description ?? "INDIRIZZO FINTO", textAlign: TextAlign.left,),
                            ],
                          ),
                        ),

                        const Spacer(),
                        annuncio.advertisementStatus != "all" ? Chip(
                          backgroundColor: annuncio.advertisementStatus == annunciStatusList[1] ?
                          verdeChip : annuncio.advertisementStatus == annunciStatusList[0] ?
                          rossoopaco : annuncio.advertisementStatus == annunciStatusList[2] ?
                          giallo : annuncio.advertisementStatus == annunciStatusList[3] ? azzurroscuro : Colors.white,
                          label: Text(
                            getCurrentLanguageValue(annuncio.advertisementStatus) ?? "ATTIVO",
                            style: TextStyle(color: Colors.white),
                          ),
                        ) : Container()
                      ],
                    )
                ),

                Padding(padding: EdgeInsets.only(top: 10)),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconaConTitolo(Icon(Icons.today_outlined,color: giallo), annuncio.date.toString() ?? "Nessuna data inserita"),
                      //iconaConTitolo(Icon(Icons.location_on_outlined,color: giallo), "" ?? ""),
                      iconaConTitolo(Icon(Icons.timer_outlined,color: giallo), annuncio.hourSlot ?? "??:??"),
                      iconaConTitolo(Icon(Icons.euro_symbol_outlined,color: giallo), annuncio.payment ?? "NS"),

                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/logo.png', width: 70, height: 70),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            RouteConstants.dettaglioAnnuncioDatore,
                            arguments: annuncio);
                      },
                      child: Icon(Icons.info_rounded, color: giallo, size: 35,),

                    )
                  ],

                ),
              ],
            )
        )
    );
  }

}

