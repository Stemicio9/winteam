

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/constants/route_constants.dart';
import 'package:winteam/pages/pagine_datore/annunci_datore.dart';
import 'package:winteam/pages/pagine_datore/notifiche_datore.dart';
import 'package:winteam/pages/pagine_datore/profilo_datore.dart';
import 'package:winteam/pages/pagine_datore/pubblica_annuncio_datore.dart';
import 'package:winteam/pages/pagine_datore/ricerca_utente_datore.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/drawerWidget.dart';
import 'package:winteam/widgets/texts.dart';
import '../../appstate/dashboard_page_state.dart';
import '../../bottombar/tab_item_icon.dart';
import '../../bottombar/tabbar.dart';
import '../../constants/colors.dart';


class DashboardDatore extends StatefulWidget {
  @override
  DashboardDatoreState createState() {
    return DashboardDatoreState();
  }

}

class DashboardDatoreState extends State<DashboardDatore> with TickerProviderStateMixin{


  PubblicaAnnuncioDatore pubblicaannuncio = PubblicaAnnuncioDatore();
  ProfiloDatore profilo = ProfiloDatore();
  NotificheDatore notifiche = NotificheDatore();
  RicercaUtenteDatore ricerca = RicercaUtenteDatore();
  AnnunciDatore annunci = AnnunciDatore();

  late TabController controller;
  late FToast fToast;


  final int bottomNavigationMenuLength = 4;

  @override
  void initState() {
    controller = TabController(length: bottomNavigationMenuLength, vsync: this);
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }


  void onChangeTab(int index) {
    selectedIndex = index;
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
            ricerca,
            pubblicaannuncio,
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
            TabItemIcon(
              iconData: Icons.search,
              curveColor: Colors.white,
            ),
            TabItemIcon(
              iconData: Icons.add_box,
              curveColor: Colors.white,
            ),
          /*  TabItemIcon(
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
      toastDuration: Duration(seconds: 4),
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
                side: BorderSide(
                    width: 2,
                    color: azzurroscuro),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'Annulla',
                style: TextStyle(
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
                'Conferma',
                style: TextStyle(
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





