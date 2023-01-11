import 'package:flutter/material.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/worker_pages/profile/data/mansione.dart';
import 'package:winteam/theme/app_style.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class CreateAdsSkill extends StatelessWidget {
  final double paddingLeft; //20
  final double paddingRight; //20
  final double paddingTop; //40

  final double customImageViewHeight; //26
  final double customImageViewWidth; //26

  final TextEditingController skillController;

  final dynamic skillValidator;

  static final List<Mansione> _kOptions = [
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Pizzaiolo'),
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Barman'),
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Cameriere'),
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Promoter'),
  ];

  CreateAdsSkill({
    Key? key,
    this.paddingTop = 40,
    this.paddingLeft = 20,
    this.paddingRight = 20,
    this.customImageViewHeight = 26,
    this.customImageViewWidth = 26,
    required this.skillController,
    this.skillValidator,
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
            MANSIONE,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratSemiBold24,
          ),
          Padding(
            padding: getPadding(top: 10, bottom: 10),
            child: Autocomplete<Mansione>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<Mansione>.empty();
                  }
                  return _kOptions.where((Mansione option) {
                    return option.text
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
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
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(4.0)),
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
                                  child: Text(option.text),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                fieldViewBuilder:
                    ((context, filterController, focusNode, onFieldSubmitted) =>
                        InputsV2Widget(
                            focusNode: focusNode,
                            hinttext: SEARCH_SKILL,
                            controller: filterController,
                            paddingRight: 0,
                            paddingLeft: 0,
                            paddingBottom: 0,
                            borderRadius: 5,
                            paddingTop: 0,
                            elevation: 5,
                            contentPaddingTop: 30,
                            isPrefixIcon: true,
                            svgPath: ImageConstant.imgBag,
                        ))),
          ),
        ],
      ),
    );
  }
}
