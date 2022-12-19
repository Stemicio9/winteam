

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
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
    String v1 = getCurrentLanguageValue(POLICY_PRIVACY)!;
    String v2 = getCurrentLanguageValue(COME_FUNZIONA)!;
    String v3 = getCurrentLanguageValue(CONTATTACI)!;
    String v4 = getCurrentLanguageValue(EVENTI)!;
    String v5 = getCurrentLanguageValue(LOGOUT)!;
    String v6 = getCurrentLanguageValue(REMOVE_ACCOUNT)!;

    listaelementimenu.add(v1);
    listaelementimenu.add(v2);
    listaelementimenu.add(v3);
    listaelementimenu.add(v4);
    listaelementimenu.add(v5);
    listaelementimenu.add(v6);

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

    // lista.add(creatile(v1, (){raccoglitore.policyprivacy(context);}, context, const IconData(0xf2d0, fontFamily: 'MaterialIcons')));
    // lista.add(creatile(v2, (){raccoglitore.comefunziona(context);}, context, const IconData(0xf669, fontFamily: 'MaterialIcons')));
    // lista.add(creatile(v3, (){raccoglitore.contattaci(context);}, context, const IconData(0xf01b2, fontFamily: 'MaterialIcons')));
    // lista.add(creatile(v4, (){raccoglitore.eventi();}, context, const IconData(0xf06ae, fontFamily: 'MaterialIcons'), comingsoon: true));
    lista.add(creatile(v5, (){ FirebaseAuth.instance.signOut();Navigator.pushNamed(context, RouteConstants.login);}, context, const IconData(0xf88b, fontFamily: 'MaterialIcons')));
    lista.add(creatile(v6, () async {
      var result = await _showMyDialog(context);
      if(result == 'OK'){
        FirebaseAuth.instance.signOut();Navigator.pushNamed(context, RouteConstants.login);
        // FirebaseAuth.instance.currentUser!.delete();
        // Navigator.pushNamed(context, RouteConstants.login);
      }
    }, context, const IconData(0xe1b9, fontFamily: 'MaterialIcons')));
    listaelementimenu.clear();

    return lista;

  }

  Future<dynamic> _showMyDialog(context) async {
    var a = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rimuovi account'),
          content: const Text('Sicuro di voler rimuovere il tuo account?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Annulla'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text('OK', style: TextStyle(color: rossoopaco),),
            ),
          ],
        );
      },
    );
    return a;
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