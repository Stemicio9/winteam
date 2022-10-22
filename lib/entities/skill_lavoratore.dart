
class SkillLavoratore {
  String? id;
  String? name;
  String? imageLink;
  String? hexColorText;
  String? hexColorBackground;


  SkillLavoratore({
    this.id,
    this.name,
    this.imageLink,
    this.hexColorText,
    this.hexColorBackground,
  });


  factory SkillLavoratore.fromJson(Map<String, dynamic> json) => SkillLavoratore(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    imageLink: json["imageLink"] ?? "",
    hexColorText: json["hexColorText"] ?? "",
    hexColorBackground: json["hexColorBackground"] ?? "",
  );

}