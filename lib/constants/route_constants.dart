import 'package:winteam/pages/drawer_pages/come_funziona.dart';
import 'package:winteam/pages/login_section/password_dimenticata.dart';
import 'package:winteam/pages/login_section/register_page.dart';
import 'package:winteam/pages/pagine_datore/dettaglio_annuncio_datore.dart';
import 'package:winteam/pages/pagine_datore/lista_candidati.dart';
import 'package:winteam/pages/pagine_datore/modifica_profilo_datore.dart';
import 'package:winteam/pages/pagine_lavoratore/aggiungi_skill.dart';
import 'package:winteam/pages/pagine_lavoratore/dettaglio_annuncio_lavoratore.dart';
import 'package:winteam/pages/pagine_lavoratore/filtri_annunci_lavoratore.dart';

import 'package:winteam/pages/pagine_datore/dashboard_datore.dart';
import 'package:winteam/pages/pagine_lavoratore/modifica_profilo_lavoratore.dart';

import '../pages/login_section/login.dart';
import '../pages/pagine_datore/pubblica_annuncio_datore.dart';
import '../pages/pagine_lavoratore/dashboard_lavoratore.dart';

class RouteConstants {
  static const String dashboardLavoratore = "/dashboardlavoratore";
  static const String dashboardDatore = "/dashboarddatore";
  static const String login = "/login";
  static const String contatti = "/contattaci";
  static const String privacypolicy = "/privacypolicy";
  static const String registrazione = "/registrazione";
  static const String comeFunziona = "/comefunziona";
  static const String passDimenticata = "/passworddimenticata";
  static const String filtriAnnunciLavoratore = "/filtriannunci";
  static const String dettaglioAnnuncioLavoratore = "/dettaglioannunciolavoratore";
  static const String dettaglioAnnuncioDatore = "/dettaglioannunciodatore";
  static const String listaCandidati = "/listacandidati";
  static const String aggiungiAnnuncio = "/aggiungiannuncio";
  static const String aggiungiSkill = "/aggiungiskill";
  static const String modificaProfiloLavoratore = "/modificaprofilolavoratore";
  static const String modificaProfiloDatore = "/modificaprofilodatore";






  static dynamic route(context) => {
    '/': (context) =>  Login(),
    dashboardLavoratore: (context) => DashboardLavoratore(),
    comeFunziona: (context) => ComeFunziona(),
    registrazione: (context) => RegisterPage(),
    login: (context) => Login(),
    passDimenticata: (context) => PasswordDimenticata(),
    filtriAnnunciLavoratore: (context) => FiltriAnnunci(),
    dashboardDatore: (context) => DashboardDatore(),
    dettaglioAnnuncioLavoratore: (context) => DettaglioAnnuncioLavoratore(),
    dettaglioAnnuncioDatore: (context) => DettaglioAnnuncioDatoreWidget(),
    listaCandidati: (context) => ListaCandidatiWidget(),
    aggiungiAnnuncio: (context) => PubblicaAnnuncioDatore(),
    aggiungiSkill: (context) => AggiungiSkill(),
    modificaProfiloLavoratore: (context) => ModificaProfiloLavoratore(),
    modificaProfiloDatore: (context) => ModificaProfiloDatore(),




  };
}