import 'package:winteam/utils/superclasses_and_mixins/autocomplete_element.dart';

class SkillEntity extends AutocompleteElement{
  String? id;
  String? hexColorText;
  String? hexColorBackground;

  SkillEntity({
    this.id,
    this.hexColorText,
    this.hexColorBackground,
    name = "",
    imageLink = "",
  }) : super(name: name, imageLink: imageLink);

  factory SkillEntity.fromJson(Map<String, dynamic> json) => SkillEntity(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        imageLink: json["imageLink"] ?? "",
        hexColorText: json["hexColorText"] ?? "",
        hexColorBackground: json["hexColorBackground"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageLink": imageLink,
        "hexColorText": hexColorText,
        "hexColorBackground": hexColorBackground
      };

  @override
  String toString() {
    return name;
  }



}
