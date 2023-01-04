import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/utils/size_utils.dart';

class EmployerAdsChoiceChip extends StatelessWidget {
  final List<bool> indexes;
  final Function(int, bool) valueSelected;
  final List<String> texts;

  const EmployerAdsChoiceChip({
    super.key,
    required this.valueSelected,
    required this.indexes,
    required this.texts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:getPadding(right: 20,left: 20),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List<Widget>.generate(
              indexes.length,
                  (int index) {
                return Padding(
                  padding: getPadding(left: 5,right: 5,bottom: 15,top: 20),
                  child: ChoiceChip(
                    shadowColor: blackTransparent,
                    elevation: indexes[index] ? 0 : 5,
                    selectedColor: green,
                    padding: getPadding(top: 15, bottom: 15, left: 15, right: 15),
                    backgroundColor: white,
                    label: Text(
                      texts[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    labelStyle: indexes[index]
                        ? const TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ) : null,
                    selected: indexes[index],
                    onSelected: (bool selected) {
                      valueSelected(index, selected);
                    },
                  ),
                );
              },
            ).toList(),
          )

      ),
    );
  }
}
