import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/widgets_v2/autocomplete.dart';

class AddSkillsAutocomplete extends StatelessWidget {
  final List<SkillEntity> kOptions;
  final TextEditingController skillsController;
  final Function(SkillEntity) onSelection;

  AddSkillsAutocomplete({
    Key? key,
    required this.skillsController,
    required this.onSelection,
    this.kOptions = const [],
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return W1NAutocomplete(
      customFilter:(TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return kOptions;
        }
        return kOptions.where((SkillEntity option) {
          return option.name.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          );
        });
      },
      filterController: skillsController,
      optionSelected: (option){
        onSelection(option);
      },
      icon: true,
      hintText: SEARCH_SKILL,
      fontSize: 18,
      fontHintSize: 18,
      paddingRight: 0,
      borderRadius: 5,
      paddingLeft: 0,
      paddingBottom: 0,
      paddingTop: 0,
      elevation: 5,
      contentPaddingTop: 40,
      prefixIcon: ImageConstant.imgSearch,
    );
  }
}
