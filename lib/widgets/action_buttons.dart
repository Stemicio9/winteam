
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winteam/widgets/texts.dart';

import '../constants/colors.dart';



Widget ActionButton(String text, BuildContext context, Function action, double maxWidth){
  return Container(
    height: 50.0,
    margin: EdgeInsets.all(10),
    child: MaterialButton(
      elevation: 10,
      onPressed: () {
        action();
        },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            color: azzurroscuro,
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints:
          BoxConstraints(maxWidth: maxWidth, minHeight: 50.0),
          alignment: Alignment.center,
          child: Texth5(testo: text,color: Colors.white,)
        ),
      ),
    ),
  );
}


