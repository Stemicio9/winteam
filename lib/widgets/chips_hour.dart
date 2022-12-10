import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';

class ChipsWidgetHour extends StatefulWidget {
  String hourSlotSelected = "";

  @override
  State<ChipsWidgetHour> createState() => ChipsWidgetHourState();
}

class ChipsWidgetHourState extends State<ChipsWidgetHour> {
  late int defaultChoiceIndex;
  final List<String> _choicesList = ['Mattina', 'Pomeriggio', 'Sera', 'Notte'];

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
          labelPadding:
              const EdgeInsets.only(right: 10, left: 10, top: 4, bottom: 4),
          label: Text(_choicesList[index]),
          selected: defaultChoiceIndex == index,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: azzurroscuro)),
          selectedColor: azzurroscuro,
          labelStyle: TextStyle(
              color: defaultChoiceIndex == index ? Colors.white : azzurroscuro,
              fontWeight: FontWeight.normal),
          onSelected: (value) {
            setState(() {
              widget.hourSlotSelected = _choicesList[index];
              defaultChoiceIndex = value ? index : defaultChoiceIndex;
            });
          },
        );
      }),
    );
  }
}
