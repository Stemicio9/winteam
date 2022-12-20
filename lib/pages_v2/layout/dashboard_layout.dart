


import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:winteam/pages_v2/W1n_scaffold.dart';

class DashboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var page1 = Container(color: Colors.red);
    var page2 = Container(color: Colors.green);
    var page3 = Container(color: Colors.blue);
    var page4 = Container(color: Colors.yellow);

    const button1 =  BottomBarItem(
      inActiveItem: Icon(
        Icons.settings,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.settings,
        color: Colors.pink,
      ),
      itemLabel: 'Page 1',
    );

    const button2 =  BottomBarItem(
      inActiveItem: Icon(
        Icons.person,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.settings,
        color: Colors.pink,
      ),
      itemLabel: 'Page 2',
    );

    const button3 =  BottomBarItem(
      inActiveItem: Icon(
        Icons.alarm,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.settings,
        color: Colors.pink,
      ),
      itemLabel: 'Page 3',
    );

    const button4 =  BottomBarItem(
      inActiveItem: Icon(
        Icons.casino_outlined,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.settings,
        color: Colors.pink,
      ),
      itemLabel: 'Page 4',
    );

    return DashboardLayout(
      pages: [
        page1,
        page2,
        page3,
        page4,
      ],
      buttons: const [
        button1,
        button2,
        button3,
        button4,
      ],
    );
    /*
    BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/search_icon.svg',
                    color: Colors.blueGrey,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/search_icon.svg',
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.pink,
                  ),
                  itemLabel: 'Page 4',
                ),
     */
  }

}



class DashboardLayout extends StatelessWidget {

  final List<Widget> pages;
  final List<BottomBarItem> buttons;
  final _pageController = PageController(initialPage: 1);



  DashboardLayout({Key? key, required this.pages, required this.buttons}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return W1NScaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            pages.length, (index) => pages[index]),
      ),
       bottomNavigationBar: AnimatedNotchBottomBar(
           pageController: _pageController,
           bottomBarItems: buildButtonBarMenu(),
           onTap: (index) {
           _pageController.animateToPage(
             index,
             duration: const Duration(milliseconds: 500),
             curve: Curves.easeIn,
           );
         },
       ),


    );
  }

  List<BottomBarItem> buildButtonBarMenu() {
    return buttons;
  }

}
