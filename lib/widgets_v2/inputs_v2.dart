import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/validators.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

class InputsV2Widget extends StatelessWidget {
  final double round = 30.0;
  final String hintText;
  TextEditingController controller;
  final dynamic validator;
  var onChanged;
  bool isPassword = false;
  bool autofocus;
  TextInputType keyboard;
  bool? enabled = true;
  final textInputAction;


  final prefixIcon;
  final bool isPrefixIcon;
  final double prefixIconWidth;
  final double prefixIconHeight;

  final suffixIcon;
  final String svgPath;

  final double suffixIconWidth;
  final double suffixIconHeight;
  final bool isSuffixIcon;


  final bool readOnly;

  final onTap;
  final bool multiline;
  final int maxLine;
  final double fontSize; //14
  final double fontHintSize; //14

  final TextAlign? textAlign;
  final dynamic focusNode;
  final double contentPaddingLeft; //20
  final double contentPaddingRight; //0

  final double contentPaddingTop; //0

  final double elevation; //0
  final double borderRadius; //3

  final double paddingLeft; //40
  final double paddingRight; //40
  final double paddingTop; //10
  final double paddingBottom; //10


  InputsV2Widget(
      {required hinttext,
      required this.controller,
      this.isPassword = false,
      this.borderRadius = 3,
      this.elevation = 0,
      this.textAlign = TextAlign.start,
      this.contentPaddingLeft = 20,
      this.contentPaddingTop = 0,
      this.contentPaddingRight = 0,
      this.validator = defaultValidator,
      this.onChanged = funzioneCostante,
      this.autofocus = false,
      this.keyboard = TextInputType.text,
      this.enabled,
      this.textInputAction = TextInputAction.next,
      this.prefixIcon,
      this.multiline = false,
      this.maxLine = 4,
      this.fontSize = 14,
      this.fontHintSize = 14,
      this.paddingRight = 40,
      this.paddingTop = 10,
      this.paddingLeft = 40,
      this.paddingBottom = 10,
      this.focusNode,
        this.onTap,
        this.readOnly = false,

        this.isPrefixIcon = false,
        this.prefixIconHeight = 25,
        this.prefixIconWidth = 25,

        this.isSuffixIcon = false,
        this.suffixIconHeight = 25,
        this.suffixIconWidth = 25,
        this.suffixIcon,
        this.svgPath ='',
      })
      : hintText = hinttext;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Padding(
        padding: EdgeInsets.only(
            left: paddingLeft,
            right: paddingRight,
            top: paddingTop,
            bottom: paddingBottom),
        child: PhysicalModel(
            borderRadius: BorderRadius.circular(borderRadius),
            color: white,
            elevation: elevation,
            shadowColor: blackTransparent,
            child: TextFormField(
              readOnly: readOnly,
              onTap: onTap,
              focusNode: focusNode,
              textAlign: textAlign!,
              validator: validator,
              style: TextStyle(
                fontSize: fontSize,
              ),
              obscureText: isPassword,
              textInputAction: textInputAction,
              onChanged: onChanged,
              controller: controller,
              keyboardType: multiline ? TextInputType.multiline : keyboard,
              maxLines: multiline ? maxLine : 1,
              onEditingComplete: () => node.nextFocus(),
              enabled: enabled,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                hintText: hintText,
                hintStyle: TextStyle(color: darkGrey, fontSize: fontHintSize),
                filled: false,
                errorStyle: const TextStyle(color: Colors.yellow),
                prefixIcon: isPrefixIcon
                    ? Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: CustomImageView(
                          imagePath: prefixIcon,
                          svgPath:svgPath,
                          height: getSize(
                            prefixIconHeight,
                          ),
                          width: getSize(
                            prefixIconWidth,
                          ),
                        ),
                      )
                    : null,

                suffixIcon: isSuffixIcon
                    ? Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: CustomImageView(

                    imagePath: suffixIcon,
                    height: getSize(
                      suffixIconHeight,
                    ),
                    width: getSize(
                      suffixIconWidth,
                    ),

                    svgPath: svgPath,

                  ),
                )
                    : null,
                contentPadding: EdgeInsets.only(
                    left: contentPaddingLeft,
                    right: contentPaddingRight,
                    top: multiline ? 40 : contentPaddingTop),
                fillColor: white,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            )));
  }
}

void funzioneCostante(String into) {}
