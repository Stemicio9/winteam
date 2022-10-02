import 'package:winteam/pages/drawer_pages/come_funziona.dart';
import 'package:winteam/pages/login_section/password_dimenticata.dart';
import 'package:winteam/pages/login_section/register_page.dart';
import 'package:winteam/pages/pagine_lavoratore/annunci_lavoratore.dart';
import 'package:winteam/pages/pagine_lavoratore/filtri_annunci_lavoratore.dart';

import 'package:winteam/pages/pagine_datore/dashboard_datore.dart';

import '../pages/login_section/login.dart';
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






  static dynamic route(context) => {
    '/': (context) =>  Login(),
    dashboardLavoratore: (context) => DashboardLavoratore(),
    comeFunziona: (context) => ComeFunziona(),
    registrazione: (context) => RegisterPage(),
    login: (context) => Login(),
    passDimenticata: (context) => PasswordDimenticata(),
    filtriAnnunciLavoratore: (context) => FiltriAnnunci(),
    dashboardDatore: (context) => DashboardDatore(),
  };
}