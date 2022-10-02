

import 'package:flutter/material.dart';
import '../constants/colors.dart';



class DrawerWidget extends StatelessWidget {

  List<String> listaelementimenu =  List.empty(growable: true);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(context: context,
          child: Container(
              decoration: const BoxDecoration(
                /*   gradient: LinearGradient(
                 begin: Alignment.bottomCenter,
                 end: Alignment.topCenter,
                 colors: [azzurroscuro,azzurrochiaro]
               ) */
                  color: azzurroscuro
              ),

              child: Container(child: ListView(children: costruiscilista(context)))

          )),
    );
  }



  costruiscilista(context){
    String v1 = "Policy privacy";
    String v2 = "Come funziona?";
    String v3 = "Contattaci";
    String v4 = "Eventi";
    String v5 = "Logout";

    listaelementimenu.add(v1);
    listaelementimenu.add(v2);
    listaelementimenu.add(v3);
    listaelementimenu.add(v4);
    listaelementimenu.add(v5);

    List<Widget> lista =  List.empty(growable: true);

    lista.add(
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.white),

          child: Image.asset("assets/images/logo.png", width: 100, height: 100),
        ),


      /* DrawerHeader(
          decoration: const BoxDecoration(color: Colors.white),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: azzurroscuro,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),

              ),
            ),
          ),
        ) */


    );

    lista.add(creatile(v1, (){raccoglitore.policyprivacy(context);}, context, const IconData(60223, fontFamily: 'MaterialIcons')));
    lista.add(creatile(v2, (){raccoglitore.comefunziona(context);}, context, const IconData(59515, fontFamily: 'MaterialIcons')));
    lista.add(creatile(v3, (){raccoglitore.contattaci(context);}, context, const IconData(57529, fontFamily: 'MaterialIcons')));
    lista.add(creatile(v4, (){raccoglitore.eventi();}, context, const IconData(59512, fontFamily: 'MaterialIcons'), comingsoon: true));
 //   lista.add(creatile(v5, (){loginservice.logout(context);}, context, const IconData(59513, fontFamily: 'MaterialIcons')));

    listaelementimenu.clear();

    return lista;

  }






  ListTile creatile(String testo, Function funzione, context, IconData icona, {bool comingsoon = false}){
    return ListTile(
      title: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              Icon(icona,color: Colors.white,),
              const SizedBox(width: 15),
              Expanded(child: Text(testo,style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700,color: Colors.white))),

              Container(
                child: comingsoon ?
                Container(
                  child: const Text("Coming Soon", style: TextStyle(fontSize: 13,color: Colors.white, fontWeight: FontWeight.w700)),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.purpleAccent
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                )

                    : Container(),
              )
            ],
          )
      ),
      onTap: (){funzione();},
    );
  }

}


final RaccoglitoreFunzioniNavigazioneMenuLaterale raccoglitore = RaccoglitoreFunzioniNavigazioneMenuLaterale();


class RaccoglitoreFunzioniNavigazioneMenuLaterale{
  void policyprivacy(context){
    Navigator.of(context).pushNamed("/privacypolicy");
  }

  void comefunziona(context){
    Navigator.of(context).pushNamed("/comefunziona");
  }

  void contattaci(context){
    Navigator.of(context).pushNamed("/contattaci");
  }

  void eventi(){

  }
}