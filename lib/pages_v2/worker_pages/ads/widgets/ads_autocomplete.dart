import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/pages_v2/worker_pages/profile/data/mansione.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class AdsAutocomplete extends StatelessWidget {

  final double topColorHeight; // 110
  final double paddingBottom;
  final TextEditingController filterController;



  static final List<Mansione> _kOptions = [
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Pizzaiolo'),
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Barman'),
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Cameriere'),
    const Mansione(icon: 'assets/images/PizzaIcon.svg', text: 'Promoter'),

  ];


  const AdsAutocomplete({
    Key? key,
    this.topColorHeight = 110,
    required this.filterController,
    this.paddingBottom = 0,
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(bottom: paddingBottom),
      child: Stack(
          children: [
        Align(
            alignment: Alignment.center,
            child: Container(
                width: size.width,
                child: Stack(
                    alignment: Alignment.topCenter, children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: getVerticalSize(
                        topColorHeight,
                      ),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: background,
                      ),
                    ),
                  ),
                Padding(
                  padding: getPadding(top: 25),
                  child: Autocomplete<Mansione>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<Mansione>.empty();
                        }
                        return _kOptions.where((Mansione option) {
                          return option.text.toLowerCase().contains(textEditingValue.text.toLowerCase()
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
                            width: MediaQuery.of(context).size.width*0.8, // <-- Right here !
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
                      fieldViewBuilder: ((context, filterController, focusNode, onFieldSubmitted) =>
                          InputsV2Widget(
                            focusNode: focusNode,
                            hinttext: ADS_AUTOCOMPLETE,
                            controller: filterController,
                            fontSize: 18,
                            fontHintSize: 18,
                            paddingRight: 18,
                            paddingLeft: 18,
                            paddingBottom: 0,
                            paddingTop: 0,
                            elevation: 5,
                            borderRadius: 50,
                            contentPaddingTop: 30,
                            isPrefixIcon: true,
                            prefixIcon: ImageConstant.imgSearch
                          ))
                  ),
                )
                ])
            )
        )
      ]),
    );
  }
}
