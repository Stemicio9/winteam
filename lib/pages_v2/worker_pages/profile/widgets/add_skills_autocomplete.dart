import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/widgets_v2/autocomplete.dart';

class AddSkillsAutocomplete extends StatelessWidget {
  final List<SkillEntity> _kOptions = [
    SkillEntity(id: '1', name: 'Carpenter', imageLink: 'assets/images/PizzaIcon.svg'),
    SkillEntity(id: '2', name: 'Electrician', imageLink: 'assets/images/PizzaIcon.svg')
  ];

  final TextEditingController skillsController;
  final Function(SkillEntity) onSelection;

  AddSkillsAutocomplete(
      {super.key, required this.skillsController, required this.onSelection});

  @override
  Widget build(BuildContext context) {
    return W1NAutocomplete(
      customFilter:(TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return _kOptions;
        }
        return _kOptions.where((SkillEntity option) {
          return option.name.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          );
        });
      },
      filterController: skillsController,
      optionSelected: (){},
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


      /*Autocomplete<SkillEntity>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return _kOptions;
          }
          return _kOptions.where((SkillEntity option) {
            return option.name!.toLowerCase().contains(
                  textEditingValue.text.toLowerCase(),
                );
          });
        },
        onSelected: (SkillEntity selection) {
          onSelection(selection);

        },
        optionsViewBuilder: (context, onSelected, options) => Align(
              alignment: Alignment.topCenter,
              child: Material(
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(4.0)),
                ),
                child: SizedBox(
                  height: 52.0 * options.length,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: options.length,
                    shrinkWrap: false,
                    itemBuilder: (BuildContext context, int index) {
                      final SkillEntity option = options.elementAt(index);
                      return InkWell(
                        onTap: () => onSelected(option),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: getPadding(right: 10),
                                child: CustomImageView(
                                  svgPath: option.imageLink,
                                  width: 13,
                                  height: 13,
                                ),
                              ),
                              Text(option.name!),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
        fieldViewBuilder:
            ((context, skillsController, focusNode, onFieldSubmitted) =>
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
                ))); */
  }
}
