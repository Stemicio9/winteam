

import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/screens/profile_page.dart';
import 'package:winteam/screens/user_list/user_list_widget.dart';
import 'package:winteam/widgets/appbars.dart';
import 'package:winteam/widgets/drawerWidget.dart';
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


//  ProfiloLavoratore profilo = ProfiloLavoratore();
//  NotificheLavoratore notifiche = NotificheLavoratore();
//  RicercaUtenteLavoratore ricerca = RicercaUtenteLavoratore();
//  AnnunciLavoratore annunci = AnnunciLavoratore();
  DatoreProfile profile = DatoreProfile();

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }



  void onChangeTab(int index) {

    selectedIndexLavoratore = index;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 4,
      child: Scaffold(
        appBar: appbarConAction(getCurrentLanguageValue(DASHBOARD_CONST)!, context),

        drawer: DrawerWidget(),

        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(

            ),
            UserListWidget(),
            Container(),
            profile,
          ],
        ),
        bottomNavigationBar: JumpingTabBar(
          controller: controller,
          onChangeTab: onChangeTab,
          backgroundColor: Colors.blue,
          circleGradient: LinearGradient(
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
            ),
            TabItemIcon(iconData: Icons.person, curveColor: Colors.white),
          ],
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }

}