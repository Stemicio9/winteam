import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';

import '../../../../constants/colors.dart';

class AdsFilterChips extends StatelessWidget {
  final List<bool> indexes;
  final Function(int, bool) valueSelected;
  final List<String> texts;

  const AdsFilterChips(
      {super.key,
      required this.valueSelected,
      required this.indexes,
      required this.texts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: getPadding(right: 35, left: 35, top: 35),
          child: Row(
            children: [
              Padding(
                padding: getPadding(right: 20),
                child: CustomImageView(
                  svgPath: ImageConstant.imgHours,
                  height: getSize(
                    20,
                  ),
                  width: getSize(
                    20,
                  ),
                ),
              ),
              Text(
                RANGE_TIME,
                style: AppStyle.txtMontserratSemiBoldBlack20,
              ),
            ],
          ),
        ),
        Padding(
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
      ],
    );
  }
}
