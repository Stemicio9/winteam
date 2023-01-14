import 'package:flutter/material.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class ActionButtonV2 extends StatelessWidget {
  final double marginBottom;
  final double marginTop;
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
  final TextAlign align;
  final double containerHeight;
  final textColor;
  final prefixIcon;
  final suffixIcon;
  final borderColor;
  final double borderWidth;
  final bool hasBorder;
  final FontWeight weight;
  final String imgPath;
  final String svgPath;
  final bool isVisible;
  final double iconWidth;
  final double iconHeight;

  ActionButtonV2(
      {this.marginBottom = 0,
        this.marginTop = 0,
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
      this.positionedRight = 20,
      this.positionedLeft = 20,
      this.positionedTop = 0,
      this.positionedBottom = 0,
      this.align = TextAlign.center,
      this.isVisible = false,
      this.imgPath = '',
      this.svgPath = '',
      this.iconWidth = 10,
      this.iconHeight = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      margin: getMargin(top:marginTop,bottom: marginBottom),
      child: MaterialButton(
        elevation: 10,
        onPressed: () {
          action();
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            border: hasBorder
                ? Border.all(color: borderColor, width: borderWidth)
                : null,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
              constraints:
                  BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text,
                          //  textAlign: align,
                          style: TextStyle(
                            fontSize: fontSize,
                            color: textColor,
                            fontWeight: weight,
                          ),
                        ),
                        isVisible
                            ? Padding(
                                padding: getPadding(left: 15),
                                child: CustomImageView(
                                  imagePath: imgPath,
                                  svgPath: svgPath,
                                  height: iconHeight,
                                  width: iconWidth,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
