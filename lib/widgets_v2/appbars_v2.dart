import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

import '../constants/colors.dart';

appbarSenzaActionsV2(BuildContext context, String titolo) {
  return AppBar(
    elevation: 0,
    leading: GestureDetector(
        onTap: () {},
        child: ExpandTapWidget(
            onTap: () {
              Navigator.pop(context);
            },
            tapPadding: const EdgeInsets.all(10.0),
            child: const Icon(
              Icons.arrow_back_ios,
              color: white,
            ))),
    backgroundColor: background,
    title: Texth2V2(
      weight: FontWeight.w600,
      testo: titolo,
      color: white,
    ),
    centerTitle: true,
  );
}

appbarConActionsV2(String titolo, context) {
  return AppBar(
    elevation: 0,
    iconTheme: const IconThemeData(color: white),
    backgroundColor: background,
    title: Texth2V2(weight: FontWeight.w600, testo: titolo, color: white),
    centerTitle: true,
    /*  actions: [
      IconButton(
          color: white,
          icon: const Icon(Icons.share),
          onPressed: () {}
      )
    ], */
  );
}
