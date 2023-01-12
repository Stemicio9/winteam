
import 'package:winteam/utils/superclasses_and_mixins/autocomplete_element.dart';

class Mansione extends AutocompleteElement{
  final String icon;
  final String text;

  Mansione({required this.icon, required this.text}) : super(name: text,
      imageLink: icon);

}