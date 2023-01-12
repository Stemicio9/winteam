import 'package:flutter/material.dart';
import 'package:winteam/utils/size_utils.dart';
import 'package:winteam/utils/superclasses_and_mixins/autocomplete_element.dart';
import 'package:winteam/widgets_v2/custom_image_view.dart';
import 'package:winteam/widgets_v2/inputs_v2.dart';

class W1NAutocomplete extends StatelessWidget {
  final Function customFilter;
  final TextEditingController filterController;
  final Function optionSelected;
  final FocusNode focusNode = FocusNode();
  final double? width;
  final bool icon;
  final String hintText;
  final double fontSize; //  18,
  final double fontHintSize; // 18,
  final double paddingRight; // 18,
  final double paddingLeft; //18,
  final double paddingBottom; // 0,
  final double paddingTop; // 0,
  final double elevation; //5,
  final double borderRadius; // 50,
  final double contentPaddingTop; //30,
  final String prefixIcon;
  final String svgPath;

  W1NAutocomplete({
    Key? key,
    required this.customFilter,
    required this.filterController,
    required this.optionSelected,
    required this.hintText,
    this.fontSize = 18,
    this.fontHintSize = 18,
    this.paddingRight = 10,
    this.paddingLeft = 10,
    this.paddingBottom = 0,
    this.paddingTop = 0,
    this.elevation = 5,
    this.borderRadius = 50,
    this.contentPaddingTop = 30,
    this.icon = true,
    this.width,
    this.prefixIcon = '',
    this.svgPath = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<AutocompleteElement>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          return customFilter(textEditingValue);
        },
        textEditingController: filterController,
        focusNode: focusNode,
        optionsViewBuilder: (context, onSelected, options) => Align(
              alignment: Alignment.topCenter,
              child: Material(
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(4.0)),
                ),
                child: Container(
                  height: 52.0 * options.length,
                  width: width, // <-- Right here !
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: options.length,
                    shrinkWrap: false,
                    itemBuilder: (BuildContext context, int index) {
                      final AutocompleteElement option =
                          options.elementAt(index);
                      return InkWell(
                        onTap: () {
                          optionSelected(option);
                          onSelected(option);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Visibility(
                                visible: icon,
                                child: Padding(
                                  padding: getPadding(right: 10),
                                  child: CustomImageView(
                                    svgPath: option.imageLink,
                                    width: 13,
                                    height: 13,
                                  ),
                                ),
                              ),
                              Text(option.name),
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
            ((context, thatFilterController, thatFocusNode, onFieldSubmitted) =>
                InputsV2Widget(
                  focusNode: focusNode,
                  hinttext: hintText,
                  controller: filterController,
                  fontSize: fontSize,
                  fontHintSize: fontHintSize,
                  paddingRight: paddingRight,
                  paddingLeft: paddingLeft,
                  paddingBottom: paddingBottom,
                  paddingTop: paddingTop,
                  elevation: elevation,
                  borderRadius: borderRadius,
                  contentPaddingTop: contentPaddingTop,
                  isPrefixIcon: prefixIcon.isEmpty && svgPath.isEmpty ? false : true,
                  prefixIcon: prefixIcon,
                  svgPath: svgPath,
                )));
  }
}
