import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
class ChipsDatoreWidget extends StatefulWidget{

  @override
  State<ChipsDatoreWidget> createState() => ChipsDatoreWidgetState();
}

class ChipsDatoreWidgetState extends State<ChipsDatoreWidget>{


  late int defaultChoiceIndex;
  List<String> _choicesList = ['Tutti', 'Attivi', 'Accettati', 'Storico'];


  @override
  void initState() {
    super.initState();
    defaultChoiceIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      children: List.generate(_choicesList.length, (index) {
        return ChoiceChip(
          labelPadding: const EdgeInsets.only(right: 15,left: 15,top: 4,bottom: 4),
          label: Text(
              _choicesList[index],
              style: const TextStyle(
                  color: Colors.white
              )
          ),
          selected: defaultChoiceIndex == index,
          shape: const StadiumBorder(
              side: BorderSide(
                  color: azzurroscuro)
          ),
          selectedColor: azzurroscuro,
          onSelected: (value) {
            setState(() {
              defaultChoiceIndex = value ? index : defaultChoiceIndex;
            });
          },
          // backgroundColor: color,
          elevation: 1,
        );
      }),
    );


    /*   return Center(
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
    ); */
  }
}

