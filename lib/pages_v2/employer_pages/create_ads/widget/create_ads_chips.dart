import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/size_utils.dart';


class CreateAdsChips extends StatelessWidget {
  final double paddingLeft; //20
  final double paddingRight; //20
  final double paddingTop; //30

  final List<bool> indexes;
  final Function(int, bool) valueSelected;
  final List<String> texts;

  CreateAdsChips({
    Key? key,
    this.paddingTop = 30,
    this.paddingLeft = 20,
    this.paddingRight = 20,
    required this.valueSelected,
    required this.indexes,
    required this.texts
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          getPadding(top: paddingTop, right: paddingRight, left: paddingLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            RANGE_TIME,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratSemiBold24,
          ),
          Padding(
            padding: getPadding(top: 15),
            child:  Padding(
              padding: getPadding(top: 15),
              child: Wrap(
                spacing: 7,
                children: List<Widget>.generate(
                  indexes.length,
                      (int index) {
                    return ChoiceChip(
                        shadowColor: blackTransparent,
                        elevation: indexes[index] ? 0 : 5,
                        padding: getPadding(top: 10, bottom: 10, left: 15, right: 15),
                        selectedColor: green,
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
                        });
                  },
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
