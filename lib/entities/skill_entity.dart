class SkillEntity {
  String? id;
  String? name;
  String? imageLink;
  String? hexColorText;
  String? hexColorBackground;

  SkillEntity({
    this.id,
    this.name,
    this.imageLink,
    this.hexColorText,
    this.hexColorBackground,
  });

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
}
