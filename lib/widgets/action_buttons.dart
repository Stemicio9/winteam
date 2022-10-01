
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';



Widget ActionButton(String text, BuildContext context, Function action){
  return Container(
    height: 50.0,
    margin: EdgeInsets.all(10),
    child: MaterialButton(
      onPressed:  () {action;},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            color: azzurroscuro,
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints:
          BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    ),
  );
}


