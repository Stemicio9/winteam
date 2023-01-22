import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/enums.dart';
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
  final Function(String) onFieldSubmitted;
  final AutocompleteSearchType type;

  final List<SkillEntity> kOptions;

  AdsAutocomplete({
    Key? key,
    this.topColorHeight = 110,
    required this.filterController,
    required this.optionSelected,
    this.paddingBottom = 0,
    this.kOptions = const [],
    this.onFieldSubmitted = emptyOptionSelected,
    this.type = AutocompleteSearchType.adSearch,
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
                      optionSelected: (SkillEntity option) {
                        onFieldSubmitted(option.id ?? '');
                      },
                      icon: true,
                      hintText: ADS_AUTOCOMPLETE_USERS,
                      prefixIcon: ImageConstant.imgSearch,
                      fontSize: 18,
                      fontHintSize: 18,
                      paddingRight: 18,
                      paddingLeft: 18,
                      contentPaddingTop: 30,
                      isSuffixIcon: true,
                      suffixIcon: ImageConstant.imgCancel,
                      suffixIconFunction: (){
                        onFieldSubmitted('');
                        filterController.clear();

                      },
                    ),
                  )
                ])))
      ]),
    );
  }


  static emptyOptionSelected(String s){
    print(s);
  }
}
