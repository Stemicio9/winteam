import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/worker_pages/profile/data/mansione.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class AddSkillsAutocomplete extends StatelessWidget {

  static final List<Mansione> _kOptions = [
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Pizzaiolo'),
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Barman'),
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Cameriere'),
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Promoter'),

  ];

  final TextEditingController skillsController;

  AddSkillsAutocomplete({super.key, required this.skillsController});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Mansione>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Mansione>.empty();
        }
        return _kOptions.where((Mansione option) {
          return option.text.toLowerCase().contains(textEditingValue.text.toLowerCase(),
          );
        });
      },
      onSelected: (Mansione selection) {



        Navigator.pop(context);
        debugPrint('You just selected $selection');
      },

        optionsViewBuilder: (context, onSelected, options) => Align(
          alignment: Alignment.topCenter,
          child: Material(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4.0)),
            ),
            child: Container(
              height: 52.0 * options.length,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                shrinkWrap: false,
                itemBuilder: (BuildContext context, int index) {
                  final Mansione option = options.elementAt(index);
                  return InkWell(
                    onTap: () => onSelected(option),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: getPadding(right:10),
                            child: CustomImageView(
                              svgPath: option.icon,
                              width: 13,
                              height: 13,
                            ),
                          ),
                          Text(option.text),
                        ],),
                    ),
                  );
                },
              ),
            ),
          ),
        ),

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
