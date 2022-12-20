import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

Widget ActionButtonV2(String text, Function action, double maxWidth){
  return Container(
    height: 50.0,
    margin: const EdgeInsets.all(10),
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
            color: green,
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
            constraints:
            BoxConstraints(maxWidth: maxWidth, minHeight: 50.0),
            alignment: Alignment.center,
            child: Texth2V2(
                testo: text,
                color: white,
                weight: FontWeight.w600,
            )
        ),
      ),
    ),
  );
}