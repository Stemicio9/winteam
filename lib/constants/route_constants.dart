
import 'package:winteam/main.dart';
import 'package:winteam/pages/pagine_lavoratore/dashboard_lavoratore.dart';

class RouteConstants {
  static const String dashboardLavoratore = "/dashboardlavoratore";



  static dynamic route(context) => {
    '/': (context) =>  DashboardLavoratore(),
    dashboardLavoratore: (context) => DashboardLavoratore(),

  };
}