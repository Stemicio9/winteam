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
      child: Column(
        children: [
          Container(margin: EdgeInsets.only(top: 10)),

          ListTile(
            title: const Text('Nome attività/utente', style: TextStyle(color: azzurroscuro),),
            subtitle: Text('Città'),
            trailing: Chip(
            backgroundColor: stato == "ATTIVO" ? verdeopaco : stato == "CHIUSO" ? rossoopaco : stato == 'STORICO' ? giallo : Colors.white,
              label: Text(
                  stato,
                style: TextStyle(color: Colors.white),
              ),
            ),
            leading: Container(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(margin: EdgeInsets.only(right: 20)),

              iconaConTitolo(Icon(Icons.today_outlined,color: giallo), '04/10'),
              iconaConTitolo(Icon(Icons.location_on_outlined,color: giallo),'5 Km'),
              iconaConTitolo(Icon(Icons.timer_outlined,color: giallo), '19:00'),
              iconaConTitolo(Icon(Icons.euro_symbol_outlined,color: giallo), '120 €'),

              Container(margin: EdgeInsets.only(left: 20)),
            ],
          ),
          ListTile(
              leading: Image.asset('assets/images/logo.png',width: 70,height: 70),
              trailing: GestureDetector(
                onTap: (){Navigator.pushNamed(context, RouteConstants.dettaglioAnnuncioLavoratore);},
                child: Icon(Icons.info_rounded, color: giallo,size: 35,),

              )

          ),
        ],
      )
  );
}


Widget CardAnnuncioDatore(BuildContext context, String stato) {
  return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Column(
        children: [
          Container(margin: EdgeInsets.only(top: 10)),

          ListTile(
            title: const Text(
              'Nome attività/utente', style: TextStyle(color: azzurroscuro),),
            subtitle: Text('Città'),
            trailing: Chip(
              backgroundColor: stato == "CHIUSO" ? verdeopaco : stato ==
                  "ATTIVO" ? rossoopaco : stato == 'STORICO' ? giallo : Colors
                  .white,
              label: Text(
                stato,
                style: TextStyle(color: Colors.white),
              ),
            ),
            leading: Container(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(margin: EdgeInsets.only(left: 20)),

              iconaConTitolo(
                  Icon(Icons.today_outlined, color: giallo), '04/10'),
              iconaConTitolo(
                  Icon(Icons.location_on_outlined, color: giallo), '5 Km'),
              iconaConTitolo(
                  Icon(Icons.timer_outlined, color: giallo), '19:00'),
              iconaConTitolo(
                  Icon(Icons.euro_symbol_outlined, color: giallo), '120 €'),

              Container(margin: EdgeInsets.only(left: 20)),
            ],
          ),
          ListTile(
              leading: Image.asset(
                  'assets/images/logo.png', width: 70, height: 70),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, RouteConstants.dettaglioAnnuncioDatore);
                },
                child: Icon(Icons.info_rounded, color: giallo, size: 35,),

              )

          ),
        ],
      )
  );
}