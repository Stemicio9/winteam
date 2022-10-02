import 'package:flutter/cupertino.dart';

Widget spaziotrawidget(context, divisorelarghezza){
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/divisorelarghezza),
  );
}

Widget spaziotrawidgetinaltezza(context, divisorealtezza){
  return Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/divisorealtezza),
  );
}