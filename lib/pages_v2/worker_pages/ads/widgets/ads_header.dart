import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/texts_v2.dart';

class AdsHeader extends StatelessWidget{

  final int offers;
  final onTap;


  const AdsHeader({super.key, this.offers = 20,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top:18,left: 18,right: 18,bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Texth2V2(
              testo: '$offers $OFFERS',
              color: black,
              weight: FontWeight.bold,

          ),

          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Texth2V2(
                    testo: FILTER,
                    color: background,
                    weight: FontWeight.bold,
                ),
                Padding(
                  padding:getPadding(left: 10,bottom: 2),
                  child: const Icon(
                    Icons.filter_alt_rounded,
                    color: background,
                  ),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
  
}