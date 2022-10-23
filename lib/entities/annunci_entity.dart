

import 'package:winteam/entities/skill_entity.dart';

class AnnunciEntity {

  final String id;
  final String title;
  final String description;
  final String date;
  final String hourSlot;
  final String skillId;
  final SkillEntity skillDTO;
  final String payment;
  final String publisherUserId;
  final List<dynamic> candidateUserList;
  final String matchedUserId;
  final String advertisementStatus;

  AnnunciEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.hourSlot,
    required this.skillId,
    required this.skillDTO,
    required this.payment,
    required this.publisherUserId,
    required this.candidateUserList,
    required this.matchedUserId,
    required this.advertisementStatus});



  factory AnnunciEntity.fromJson(Map<String, dynamic> json) => AnnunciEntity(
    id: json["id"] ?? "",
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    date: json["date"] ?? "",
    hourSlot: json["hourSlot"] ?? "",
    skillId: json["skillId"] ?? "",
    skillDTO: json["skillDTO"] != null ? SkillEntity.fromJson(json["skillDTO"]): SkillEntity(),
    payment: json["payment"].toString() ?? "",
    publisherUserId: json["publisherUserId"] ?? "",
    candidateUserList: json["candidateUserList"] ?? "",
    matchedUserId: json["matchedUserId"] ?? "",
    advertisementStatus: json["advertisementStatus"] ?? ""

  );

  Map<String,dynamic> toJson() => {
    "id" : id,
    "title" : title,
    "description" : description,
    "date" : date,
    "hourSlot" : hourSlot,
    "skillId" : skillId,
    "payment" : payment,
    "publisherUserId" : publisherUserId,
    "candidateUserList" : candidateUserList,
    "matchedUserId" : matchedUserId,
    "advertisementStatus" : advertisementStatus
  };

}

