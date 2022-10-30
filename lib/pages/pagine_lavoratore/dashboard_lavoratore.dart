

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages/pagine_lavoratore/profilo_lavoratore.dart';
import 'package:winteam/pages/pagine_lavoratore/ricerca_utente_lavoratore.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/drawerWidget.dart';
import 'package:winteam/widgets/texts.dart';
import '../../appstate/dashboard_page_state.dart';
import '../../bottombar/tab_item_icon.dart';
import '../../bottombar/tabbar.dart';
import '../../constants/colors.dart';
import 'annunci_lavoratore.dart';
import 'notifiche_lavoratore.dart';

class DashboardLavoratore extends StatefulWidget {
  @override
  DashboardLavoratoreState createState() {
    return DashboardLavoratoreState();
  }

}

class DashboardLavoratoreState extends State<DashboardLavoratore> with TickerProviderStateMixin{


  ProfiloLavoratore profilo = ProfiloLavoratore();
  NotificheLavoratore notifiche = NotificheLavoratore();
  RicercaUtenteLavoratore ricerca = RicercaUtenteLavoratore();
  AnnunciLavoratore annunci = AnnunciLavoratore();

  late TabController controller;
  late FToast fToast;

  final int bottomNavigationMenuLength = 2;

  @override
  void initState() {
    controller = TabController(length: bottomNavigationMenuLength, vsync: this);
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }


  void onChangeTab(int index) {
    selectedIndexLavoratore = index;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(

      onWillPop: () {
        return onWillPop(context);
      },

    child: DefaultTabController(

      length: 4,
      child: Scaffold(
        appBar: appbarConAction(getCurrentLanguageValue(DASHBOARD_CONST)!, context),

        drawer: DrawerWidget(),

        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            annunci,
           // ricerca,
           // notifiche,
            profilo
          ],
        ),
        bottomNavigationBar: JumpingTabBar(
          controller: controller,
          onChangeTab: onChangeTab,
          backgroundColor: Colors.blue,
          circleGradient: const LinearGradient(
            colors: [
              giallo,
              Colors.amber,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          items: [
            TabItemIcon(
              iconData: Icons.wysiwyg,
              curveColor: Colors.white,
            ),
   /*         TabItemIcon(
              iconData: Icons.search,
              curveColor: Colors.white,
            ), */
        /*    TabItemIcon(
                buildWidget: (_, color) => Stack(
                  children: <Widget>[
                    const Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.white,
                    ),
                    Positioned(
                      top: 1.0,
                      right: 0.0,
                      child: Stack(
                        children: const <Widget>[
                          Icon(
                            Icons.brightness_1,
                            size: 18.0,
                            color: verdepieno,
                          ),
                          Positioned(
                            top: 1.0,
                            right: 4.0,
                            child: Text("2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                curveColor: Colors.white
            ), */
            TabItemIcon(iconData: Icons.person, curveColor: Colors.white),
          ],
          selectedIndex: selectedIndex,
        ),
      ),
    )
  );

  showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Logout effettuato con successo"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
    );
  }
  Future<bool> onWillPop(context) async {
    final shouldpop = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          title: Texth3(
            testo:'Vuoi effettuare il logout?',
            color: Colors.black,
          ),

          actions: <Widget>[

            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  side: const BorderSide(
                      width: 2,
                      color: azzurroscuro),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  getCurrentLanguageValue(ANNULLA)!,
                  style: const TextStyle(
                      fontSize: 15,
                      color: azzurroscuro
                  ),
                )
            ),


            MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  showToast();
                  Navigator.pushNamed(context, RouteConstants.login);                },
                color: rossoopaco,
                //   padding: EdgeInsets.all(10),

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                child: Text(
                  getCurrentLanguageValue(CONFERMA)!,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white
                  ),
                )
            ),

          ],
        )
    );
    return shouldpop ?? false;
  }
}