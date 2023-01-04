import 'package:flutter/material.dart';
import 'package:winteam/constants/colors.dart';
import 'package:winteam/constants/language.dart';
import 'package:winteam/utils/image_constant.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class SearchWorkerAutocomplete extends StatelessWidget {

  final double topColorHeight; // 110
  final TextEditingController filterController;

  static const List<String> _kOptions = <String>[
    'Pizzaiolo',
    'Barman',
    'Cameriere',
    'Promoter',
  ];


  const SearchWorkerAutocomplete({
    Key? key,
    this.topColorHeight = 110,
    required this.filterController
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:getPadding(bottom: 25),
      child: Stack(
          children: [
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
                      decoration: BoxDecoration(
                        color: background,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 25),
                    child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            return const Iterable<String>.empty();
                          }
                          return _kOptions.where((String option) {
                            return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        onSelected: (String selection) {
                          Navigator.pop(context);
                          debugPrint('You just selected $selection');
                        },
                        fieldViewBuilder: ((context, filterController, focusNode, onFieldSubmitted) =>
                            InputsV2Widget(
                                focusNode: focusNode,
                                hinttext: MANSIONE,
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
