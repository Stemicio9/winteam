
class SkillEntity {
  String? id;
  String? name;
  String? imageLink;


  SkillEntity({
    this.id,
    this.name,
    this.imageLink
  });


  factory SkillEntity.fromJson(Map<String, dynamic> json) => SkillEntity(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    imageLink: json["imageLink"] ?? "",
  );

}