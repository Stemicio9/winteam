
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';
import 'package:winteam/pages_v2/layout/widgets/bottom_bar_element.dart';
import 'package:winteam/pages_v2/worker_pages/ads/worker_ads_v2.dart';
import 'package:winteam/pages_v2/worker_pages/profile/worker_profile_v2.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

class DashboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var page1 = Container(key: GlobalKey(),color: white);
   // var page2 = Container(key: GlobalKey(),color: white);
    var page3 = WorkerAdsV2();
    var page4 = WorkerProfileV2();

    var button1 = BottomBarElement(
      activeElement: Icon(Icons.home, color: white),
      inactiveElement: Text(HOME),
    );

    var button2 = BottomBarElement(
      activeElement: Icon(Icons.alarm, color: white),
      inactiveElement: Text(NOTIFICATIONS),
    );

    var button3 = BottomBarElement(
      activeElement: Icon(Icons.newspaper_rounded, color: white),
      inactiveElement: Texth4V2(testo:DASHBOARD, color: white),

    );

    var button4 = BottomBarElement(
      activeElement: Icon(Icons.person, color: white),
      inactiveElement: Texth4V2(testo:DASHBOARD, color: white),

    );

    return DashboardLayout(
      maxCount: 4,
      pages: [
      //  page1,
      //  page2,
        page3,
        page4,
      ],
      buttons: [
      //  button1,
       // button2,
        button3,
        button4,
      ],
    );

  }

}


class DashboardLayout extends StatefulWidget {
  final List<Widget> pages;
  final List<BottomBarElement> buttons;
  final int maxCount;


  const DashboardLayout({Key? key, required this.pages, required this.buttons, required this.maxCount}) : super(key: key);

  @override
  DashboardLayoutState createState() {
   return DashboardLayoutState();
  }

}

class DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin{


  final _pageController = PageController(initialPage: 1);
  int _tabIndex = 1;

  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return W1NScaffoldDashboard(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: widget.pages
      ),
       bottomNavigationBar: CircleNavBar(

         activeIcons: const [
           // Icon(Icons.home, color: white),
           // Icon(Icons.alarm, color: white),
           Icon(Icons.newspaper_rounded, color: white),
           Icon(Icons.person, color: white),
         ],
         inactiveIcons:  [
           // Text(HOME,style: TextStyle(color: white),),
           // Text(NOTIFICATIONS,style: TextStyle(color: white),),
           Texth4V2(testo:DASHBOARD, color: white),
           Texth4V2(testo:PROFILE,color: white),
         ],
         circleColor: green,
         color: background,
         height: 60,
         circleWidth: 60,
         activeIndex: tabIndex,
         onTap: (index) {
           tabIndex = index;
           _pageController.jumpToPage(tabIndex);
         },
         padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
         cornerRadius: const BorderRadius.only(
           topLeft: Radius.circular(8),
           topRight: Radius.circular(8),
           bottomRight: Radius.circular(24),
           bottomLeft: Radius.circular(24),
         ),
         elevation: 10,
       ),


    );
  }



}
