import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/route_constants.dart';


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
                            width: 2
                        ),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profiledefault.jpeg'),
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




Widget CardAnnuncioDatore(BuildContext context, String stato) {
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
                            width: 2
                        ),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profiledefault.jpeg'),
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
                      backgroundColor: stato == "CHIUSO" ? Colors.green : stato == "ATTIVO" ? rossoopaco : stato == 'STORICO' ? giallo : Colors.white,
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
                Image.asset('assets/images/logo.png', width: 70, height: 70),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteConstants.dettaglioAnnuncioDatore);
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