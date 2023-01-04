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
  final double maxHeight;
  final double fontSize;

  final double positionedRight;
  final double positionedLeft;
  final double positionedTop;
  final double positionedBottom;


  final double containerHeight;

  final textColor;
  final prefixIcon;
  final suffixIcon;
  final borderColor;
  final double borderWidth;
  final bool hasBorder;
  final FontWeight weight;


  ActionButtonV2({
    this.margin = 0,
    required this.action,
    required this.text,
    required this.color,
    required this.maxWidth,
    this.maxHeight = 100,
    this.weight = FontWeight.w600,
    required this.textColor,
    this.borderColor,
    this.borderWidth = 0.5,
    this.hasBorder = false,
    this.fontSize = 18,
    this.prefixIcon,
    this.suffixIcon,
    this.containerHeight = 50,
    this.positionedRight =20,
    this.positionedLeft=20,
    this.positionedTop=0,
    this.positionedBottom=0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      margin: EdgeInsets.all(margin),
      child: MaterialButton(
        elevation: 10,
        onPressed: () {
          action();
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
        ),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              color: color,
              border: hasBorder ? Border.all(
                color: borderColor,
                width: borderWidth
              ):
              null,
              borderRadius: BorderRadius.circular(30.0),

          ),

          child: Container(
              constraints: BoxConstraints(
                  maxWidth: maxWidth,
                  maxHeight: maxHeight
              ),
              alignment: Alignment.center,
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Positioned(
                      left: positionedLeft,
                      top: positionedTop,
                      bottom: positionedBottom,
                      child: Icon(prefixIcon),
                    ),
                    Align(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: textColor,
                          fontWeight: weight,
                        ),

                      ),
                    ),
                    Positioned(
                      right: positionedRight,
                      top: positionedTop,
                      bottom: positionedBottom,
                      child: Icon(suffixIcon),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
