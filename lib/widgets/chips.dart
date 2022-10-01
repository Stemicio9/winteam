import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
class ChipsWidget extends StatefulWidget{
  @override
  State<ChipsWidget> createState() => ChipsWidgetState();
}

class ChipsWidgetState extends State<ChipsWidget>{

//  late String label;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChoiceChip(
          label: Text('Chip di prova'),
          selected: isSelected,
          shape: StadiumBorder(
              side: BorderSide(
                  color: azzurroscuro)
          ),
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : azzurroscuro,
          ),

          selectedColor: azzurroscuro,
          onSelected: (newBoolvalue) {
            setState(() {
              isSelected = newBoolvalue;
            }
            );
          }
      ),
    );
  }
}