

import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/pages_v2/background/background.dart';
import 'package:winteam/widgets/utilities/close_on_tap.dart';
import 'package:winteam/widgets_v2/appbars_v2.dart';


class W1NScaffoldDashboard extends StatelessWidget {

  final Widget body;
  final Widget? bottomNavigationBar;

  const W1NScaffoldDashboard({Key? key, required this.body, this.bottomNavigationBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CloseOnTapUtility(
          child: body
      ),
      bottomNavigationBar: bottomNavigationBar ?? Container(),
    );
  }
}


class W1NScaffoldWithBackground extends StatelessWidget {

  final Widget body;

  const W1NScaffoldWithBackground({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: CloseOnTapUtility(
          child: Stack(
            children: [
              BackgroundV2(),
              body
            ],
          )
      ),
    );
  }
}



class W1NScaffold extends StatelessWidget {

  final Widget body;
  final String title;
  final backgroundColor;

  const W1NScaffold({Key? key, required this.body,required this.title, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appbarConActionsV2(title, context),
      resizeToAvoidBottomInset: false,
      body: CloseOnTapUtility(
          child: body
      ),
    );
  }
}




class W1NScaffoldSenzaAction extends StatelessWidget {

  final Widget body;
  final String title;

  const W1NScaffoldSenzaAction({Key? key, required this.body,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarSenzaActionsV2(context, title),
      resizeToAvoidBottomInset: false,
      body: CloseOnTapUtility(
          child: body
      ),
    );
  }
}


