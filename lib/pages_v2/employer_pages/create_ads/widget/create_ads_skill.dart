import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/autocomplete.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class CreateAdsSkill extends StatelessWidget {
  final double paddingLeft; //20
  final double paddingRight; //20
  final double paddingTop; //40
  final TextEditingController filterController;
  final Function optionSelected;


  final List<SkillEntity> _kOptions = [
    SkillEntity(id: '1', name: 'Carpenter', imageLink: 'assets/images/PizzaIcon.svg'),
    SkillEntity(id: '2', name: 'Electrician', imageLink: 'assets/images/PizzaIcon.svg')
  ];

  CreateAdsSkill(
      {Key? key,
      this.paddingTop = 40,
      this.paddingLeft = 20,
      this.paddingRight = 20,
      required this.filterController,
      required this.optionSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          getPadding(
              top: paddingTop,
              right: paddingRight,
              left: paddingLeft
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MANSIONE,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratSemiBold24,
          ),
          Padding(
            padding: getPadding(top: 10, bottom: 10),
            child:
                  W1NAutocomplete(
              customFilter: (TextEditingValue textEditingValue) {
                print("RICERCO");
                print(textEditingValue.text);
                if (textEditingValue.text == '') {
                  return _kOptions;
                }
                return _kOptions.where((SkillEntity option) => option.name.toLowerCase().contains(textEditingValue.text.toLowerCase()));
              },

              filterController: filterController,
              optionSelected: (){},
              icon: false,
              hintText: SEARCH_SKILL,
              paddingRight: 0,
              paddingLeft: 0,
              paddingBottom: 0,
              borderRadius: 5,
              paddingTop: 0,
              elevation: 5,
              contentPaddingTop: 30,
              svgPath: ImageConstant.imgBag,

            ),


          ),
        ],
      ),
    );
  }
}
