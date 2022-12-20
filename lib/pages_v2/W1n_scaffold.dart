

import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/pages_v2/background/background.dart';
import 'package:winteam/widgets/utilities/close_on_tap.dart';


class W1NScaffold extends StatelessWidget {

  final Widget body;

  const W1NScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CloseOnTapUtility(child: body),
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