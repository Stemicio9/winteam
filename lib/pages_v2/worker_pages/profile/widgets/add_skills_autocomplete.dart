import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class AddSkillsAutocomplete extends StatelessWidget {
  static const List<String> _kOptions = <String>[
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
  ];
  final TextEditingController skillsController;

  AddSkillsAutocomplete({super.key, required this.skillsController});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(
              textEditingValue.text.toLowerCase(),
          );
        });
      },
      onSelected: (String selection) {
        Navigator.pop(context);
        debugPrint('You just selected $selection');
      },
      fieldViewBuilder: ((context, skillsController, focusNode, onFieldSubmitted) =>
            InputsV2Widget(
              focusNode: focusNode,
              hinttext: SEARCH_SKILL,
              controller: skillsController,
              fontSize: 18,
              fontHintSize: 18,
              paddingRight: 0,
              paddingLeft: 0,
              paddingBottom: 0,
              paddingTop: 0,
              elevation: 5,
              contentPaddingTop: 40,
            ))
    );
  }
}
