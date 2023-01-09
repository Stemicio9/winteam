import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:winteam/constants/colors.dart';

class TooltipWidget extends StatelessWidget{


  final String message;
  final direction;
  final child;


  TooltipWidget({required this.message, required this.direction, required this.child});


  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
      elevation: 5,
      preferredDirection: direction,
      tailLength: 10,
      tailBaseWidth: 10,
      isModal: true,
      backgroundColor: black,
      content: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          message,
          style: const TextStyle(
              color: white
          ),
        ),
      ),
      child: child
    );
  }

}