import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/divider_v2.dart';

class AdsDetailDescription extends StatelessWidget {
  final String description;

  AdsDetailDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 30, right: 35, left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ADS_DESCRIPTION, style: AppStyle.txtMontserratSemiBold24),
          Padding(
            padding: getPadding(top: 15, bottom: 30),
            child: Text(
              description,
              style: AppStyle.txtMontserratRegular20,
            ),
          ),
          DividerV2(
            indent: 0,
            endIndent: 0,
          )
        ],
      ),
    );
  }
}
