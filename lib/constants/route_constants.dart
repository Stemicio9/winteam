
import 'package:winteam/pages/pagine_datore/dettaglio_annuncio_datore.dart';
import 'package:winteam/pages/pagine_datore/lista_candidati.dart';
import 'package:winteam/pages/pagine_datore/modifica_profilo_datore.dart';
import 'package:winteam/pages/pagine_lavoratore/dettaglio_annuncio_lavoratore.dart';
import 'package:winteam/pages/pagine_lavoratore/filtri_annunci_lavoratore.dart';
import 'package:winteam/pages/pagine_datore/dashboard_datore.dart';
import 'package:winteam/pages/pagine_lavoratore/modifica_profilo_lavoratore.dart';
import 'package:winteam/pages_v2/employer_pages/ads/candidates_list.dart';
import 'package:winteam/pages_v2/employer_pages/profile/employer_profile_edit_v2.dart';
import 'package:winteam/pages_v2/forgot_password/forgot_password_v2.dart';
import 'package:winteam/pages_v2/layout/dashboard_layout.dart';
import 'package:winteam/pages_v2/login/login_v2.dart';
import 'package:winteam/pages_v2/register/register_v2.dart';
import 'package:winteam/pages_v2/worker_pages/ads/ads_detail.dart';
import 'package:winteam/pages_v2/worker_pages/ads/ads_filter.dart';
import 'package:winteam/pages_v2/worker_pages/profile/add_skills.dart';
import 'package:winteam/pages_v2/worker_pages/profile/worker_profile_edit_v2.dart';
import 'package:winteam/widgets/select_skill_page.dart';
import '../pages/pagine_datore/pubblica_annuncio_datore.dart';
import '../pages/pagine_lavoratore/dashboard_lavoratore.dart';

class RouteConstants {
  static const String dashboardLavoratore = "/dashboardlavoratore";
  static const String dashboardDatore = "/dashboarddatore";
  static const String contatti = "/contattaci";
  static const String privacypolicy = "/privacypolicy";
  static const String comeFunziona = "/comefunziona";
  static const String filtriAnnunciLavoratore = "/filtriannunci";
  static const String dettaglioAnnuncioLavoratore = "/dettaglioannunciolavoratore";
  static const String dettaglioAnnuncioDatore = "/dettaglioannunciodatore";
  static const String listaCandidati = "/listacandidati";
  static const String aggiungiAnnuncio = "/aggiungiannuncio";
  static const String aggiungiSkill = "/aggiungiskill";
  static const String modificaProfiloLavoratore = "/modificaprofilolavoratore";
  static const String modificaProfiloDatore = "/modificaprofilodatore";



  //new page
  static const String dashboard = "/dashboard";
  static const String workerProfileEdit = "/workeredit";
  static const String addSkills = "/addskills";
  static const String adsDetail = "/adsdetail";
  static const String adsFilter = "/adsfilter";
  static const String candidatesList = "/candidateslist";
  static const String employerProfileEdit = "/employeredit";
  static const String login = "/login";
  static const String registrazione = "/registrazione";
  static const String passDimenticata = "/passworddimenticata";






  static dynamic route(context) => {
//  '/': (context) =>  Login(),
    '/': (context) =>  LoginPageV2(),


    //new page
    passDimenticata: (context) => ForgotPasswordV2(),
    dashboard: (context) => DashboardWidget(),
    login: (context) => LoginPageV2(),
    registrazione: (context) => RegisterPageV2(),
    workerProfileEdit: (context) => WorkerProfileEditV2(),
    addSkills: (context) => AddSkills(),
    adsDetail: (context) => AdsDetail(),
    adsFilter: (context) => AdsFilter(),
    candidatesList: (context) => CandidatesList(),
    employerProfileEdit: (context) => EmployerProfileEditV2(),



    //old page
    filtriAnnunciLavoratore: (context) => FiltriAnnunci(),
    dashboardDatore: (context) => DashboardDatore(),
    dashboardLavoratore: (context) => DashboardLavoratore(),
    dettaglioAnnuncioLavoratore: (context) => DettaglioAnnuncioLavoratore(),
    dettaglioAnnuncioDatore: (context) => DettaglioAnnuncioDatoreWidget(),
    listaCandidati: (context) => ListaCandidatiWidget(),
    aggiungiAnnuncio: (context) => PubblicaAnnuncioDatore(),
    aggiungiSkill: (context) => SelectSkillPage(),
    modificaProfiloLavoratore: (context) => ModificaProfiloLavoratore(),
    modificaProfiloDatore: (context) => ModificaProfiloDatore(),
    //comeFunziona: (context) => ComeFunziona(),
    //registrazione: (context) => RegisterPage(),
    //login: (context) => Login(),
    // passDimenticata: (context) => PasswordDimenticata(),

  };
}