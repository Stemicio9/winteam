import 'package:flutter/material.dart';
import 'package:winteam/widgets/texts.dart';
import '../constants/colors.dart';



Widget ActionButton(String text, Function action, double maxWidth, Color color, Color textColor){
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
            color: color,
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints:
          BoxConstraints(maxWidth: maxWidth, minHeight: 50.0),
          alignment: Alignment.center,
          child: Texth5(testo: text,color: textColor)
        ),
      ),
    ),
  );
}


Widget ActionButtonFiltri(String testo, BuildContext context, Function action, double maxWidth, IconData icona){
  return Container(
    height: 40.0,
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
            border: Border.all(color: azzurroscuro),
            borderRadius: BorderRadius.circular(10.0)),
        child: Container(
            constraints:
            BoxConstraints(maxWidth: maxWidth, minHeight: 50.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child:  Icon(icona,color: Colors.white),
                ),

                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Text(testo, style: TextStyle(color: Colors.white),)

                ),
                Container(),
              ],
            ),
        ),
      ),
    ),
  );
}


Widget ActionButtonAnnunci(String text, BuildContext context, Function action, double maxWidth){
  return Container(
    height: 40.0,
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
            color: Color.fromRGBO(220,220,220,80),
            border: Border.all(color: azzurroscuro,width: 2),
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
            constraints:
            BoxConstraints(maxWidth: maxWidth, minHeight: 50.0),
            alignment: Alignment.center,
            child: Texth5(testo: text,color: azzurroscuro)
        ),
      ),
    ),
  );
}
