import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

class ActionButtonV2 extends StatelessWidget {
  final double margin;
  final action;
  final String text;
  final color;
  final double maxWidth;
  final textColor;
  final icon;

  ActionButtonV2({
    this.margin = 0,
    required this.action,
    required this.text,
    required this.color,
    required this.maxWidth,
    required this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.all(margin),
      child: MaterialButton(
        elevation: 10,
        onPressed: () {
          action();
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(30.0)),
          child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth, minHeight: 50.0),
              alignment: Alignment.center,
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      child: Icon(icon),
                    ),
                    Align(
                      child: Texth2V2(
                        testo: text,
                        color: textColor,
                        weight: FontWeight.w600,
                        textalign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
