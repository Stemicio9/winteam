
class SkillLavoratore {
  String? id;
  String? name;
  String? imageLink;


  SkillLavoratore({
    this.id,
    this.name,
    this.imageLink
  });


  factory SkillLavoratore.fromJson(Map<String, dynamic> json) => SkillLavoratore(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    imageLink: json["imageLink"] ?? "",
  );

}