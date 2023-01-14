import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/autocomplete.dart';

class AdsAutocomplete extends StatelessWidget {
  final double topColorHeight; // 110
  final double paddingBottom;
  final TextEditingController filterController;
  final Function optionSelected;

  final List<SkillEntity> kOptions;

  AdsAutocomplete({
    Key? key,
    this.topColorHeight = 110,
    required this.filterController,
    required this.optionSelected,
    this.paddingBottom = 0,
    this.kOptions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(bottom: paddingBottom),
      child: Stack(children: [
        Align(
            alignment: Alignment.center,
            child: Container(
                width: size.width,
                child: Stack(alignment: Alignment.topCenter, children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: getVerticalSize(
                        topColorHeight,
                      ),
                      width: size.width,
                      decoration: const BoxDecoration(
                        color: background,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 25),
                    child: W1NAutocomplete(
                      customFilter: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return kOptions;
                        }
                        return kOptions.where((SkillEntity option) => option.name.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                      },
                      filterController: filterController,
                      optionSelected: () {},
                      icon: true,
                      hintText: ADS_AUTOCOMPLETE,
                      prefixIcon: ImageConstant.imgSearch,
                      fontSize: 18,
                      fontHintSize: 18,
                      paddingRight: 18,
                      paddingLeft: 18,
                      contentPaddingTop: 30,
                    ),
                  )
                ])))
      ]),
    );
  }
}
