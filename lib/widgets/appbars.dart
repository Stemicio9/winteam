import 'package:flutter/material.dart';
import 'package:winteam/widgets/texts.dart';
import '../constants/colors.dart';



appbarSenzaActions(BuildContext context,String titolo){
  return AppBar(
    leading: GestureDetector(
      onTap: (){Navigator.pop(context);},
      child: Icon(Icons.arrow_back_ios,color: Colors.white,)
    ),
    backgroundColor: azzurroscuro,
    title: Texth1(testo: titolo,color: Colors.white,),
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
    title: Texth1(testo: titolo,color: Colors.white),
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