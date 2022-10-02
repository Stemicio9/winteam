import 'package:flutter/material.dart';
import 'package:winteam/widgets/texts.dart';
import '../constants/colors.dart';



appbarSenzaActions(String titolo){
  return AppBar(
    backgroundColor: azzurroscuro,
    title: Texth1(testo: titolo),
    centerTitle: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30)
        )
    ),
  );
}



appbarConAction(String titolo,context) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: azzurroscuro,
    title: Texth1(testo: titolo),
    centerTitle: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30)
        )
    ),

    actions: [
      IconButton(color: Colors.white,
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            context;
          })
    ],

  );
}