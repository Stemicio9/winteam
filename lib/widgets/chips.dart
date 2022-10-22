import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
class ChipsWidget extends StatefulWidget{

  @override
  State<ChipsWidget> createState() => ChipsWidgetState();
}

class ChipsWidgetState extends State<ChipsWidget>{

  late int defaultChoiceIndex;
  List<String> _choicesList = ['Tutti', 'Ricerca', 'Accettati', 'Storico'];

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
         backgroundColor: Colors.white,
         labelPadding: const EdgeInsets.only(right: 10,left: 10,top: 4,bottom: 4),
         label: Text(_choicesList[index]),
         selected: defaultChoiceIndex == index,
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10),
             side: BorderSide(color: azzurroscuro)
         ),
         selectedColor: azzurroscuro,
         labelStyle: TextStyle(
           color: defaultChoiceIndex == index ? Colors.white : azzurroscuro,
           fontWeight: FontWeight.normal
         ),
         onSelected: (value) {
           setState(() {
             defaultChoiceIndex = value ? index : defaultChoiceIndex;
           });
         },
         // backgroundColor: color,
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

