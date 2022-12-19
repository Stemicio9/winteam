

import 'package:flutter/material.dart';
import 'package:winteam/widgets/utilities/close_on_tap.dart';


class W1NScaffold extends StatelessWidget {

  final Widget body;

  const W1NScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CloseOnTapUtility(child: body),
    );
  }
}


