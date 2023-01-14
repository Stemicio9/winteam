import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/pages_v2/background/background.dart';
import 'package:winteam/widgets/utilities/close_on_tap.dart';
import 'package:winteam/widgets_v2/appbars_v2.dart';
import 'package:winteam/widgets_v2/drawer_widget_v2.dart';

enum Appbars {
  noAppBar,
  appbarWithoutActions,
  appbarWithActions
}

class W1nScaffold extends StatelessWidget {
  final Widget body;
  // 0 = no appBar, 1 = Appbar without actions, 2 = Appbar with actions
  final int appBar;
  final Widget? bottomNavigationBar;
  final String title;
  final Color backgroundColor;
//  final bool hasBottomNavigationBar;
  final bool hasBackgroundColor;

  const W1nScaffold({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
    this.title = "",
    this.appBar = 0,

    this.backgroundColor = white,
//    this.hasBottomNavigationBar = false,
    this.hasBackgroundColor = false,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: appBar >= 2 ? DrawerWidgetV2() : null,
        appBar: appBar == 0
            ? null
            : appBar == 1
                ? appbarSenzaActionsV2(context, title)
                : appbarConActionsV2(title, context),
        backgroundColor: hasBackgroundColor == true
            ? Theme.of(context).backgroundColor
            : backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
        resizeToAvoidBottomInset: false,
        body: CloseOnTapUtility(
            child: Stack(
              children: [
                hasBackgroundColor == true ? const BackgroundV2() : Container(),
                body
              ]
            )
        )
    );
  }
}
