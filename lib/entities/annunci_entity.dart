import 'package:winteam/entities/skill_entity.dart';

class AnnunciEntity {
  final String? id;
  final String title;
  final String description;
  final String position;
  final String date;
  final String hourSlot;
  final String image;
  final String skillId;
  final SkillEntity? skillDTO;
  final String payment;
  final String publisherUserId;
  final List<dynamic> candidateUserList;
  final String matchedUserId;
  final String advertisementStatus;

  AnnunciEntity(
      {
        this.id,
      required this.title,
      required this.description,
      required this.position,
      required this.date,
      required this.image,
      required this.hourSlot,
      required this.skillId,
      this.skillDTO,
      required this.payment,

      required this.publisherUserId,
      required this.candidateUserList,
      required this.matchedUserId,
      required this.advertisementStatus});

  factory AnnunciEntity.fromJson(Map<String, dynamic> json) => AnnunciEntity(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      position: json["position"] ?? "",
      date: json["date"] ?? "",
      image: json["image"] ?? 'assets/images/img_pexelsphotoby.png',
      hourSlot: json["hourSlot"] ?? "",
      skillId: json["skillId"] ?? "",
      skillDTO: json["skillDTO"] != null
          ? SkillEntity.fromJson(json["skillDTO"])
          : SkillEntity(),
      payment: json["payment"].toString() ?? "",
      publisherUserId: json["publisherUserId"] ?? "",
      candidateUserList: json["candidateUserList"] ?? "",
      matchedUserId: json["matchedUserId"] ?? "",
      advertisementStatus: json["advertisementStatus"] ?? "");

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "position": position,
        "date": date,
        "hourSlot": hourSlot,
        "skillId": skillId,
        "payment": payment,
        "publisherUserId": publisherUserId,
        "candidateUserList": candidateUserList,
        "matchedUserId": matchedUserId,
        "advertisementStatus": advertisementStatus
      };
}
