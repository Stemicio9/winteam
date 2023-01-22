import 'package:winteam/entities/skill_entity.dart';
import 'package:winteam/entities/user_entity.dart';

class AnnunciEntity {
  final String? id;
  final String description;
  final String position;
  final DateTime date;
  final String hourSlot;
  final String image;
  final SkillEntity? skill;
  final String payment;
  final UserEntity? publisherUser;
  final List<dynamic> candidateUserList;
  final UserEntity? matchedUser;
  final String advertisementStatus;

  AnnunciEntity(
      {this.id,
      required this.description,
      required this.position,
      required this.date,
      required this.image,
      required this.hourSlot,
      this.skill,
      this.publisherUser,
      required this.payment,
      required this.candidateUserList,
      this.matchedUser,
      required this.advertisementStatus});

  //write to String
  @override
  String toString() {
    return 'AnnunciEntity{id: $id, description: $description, position: $position, date: $date, hourSlot: $hourSlot, image: $image, skill: $skill, payment: $payment, publisherUser: $publisherUser, candidateUserList: $candidateUserList, matchedUser: $matchedUser, advertisementStatus: $advertisementStatus}';
  }

  AnnunciEntity copyWith(
      {String? id,
      String? description,
      String? position,
        DateTime? date,
      String? hourSlot,
      String? image,
      SkillEntity? skill,
      String? payment,
      UserEntity? publisherUser,
      List<dynamic>? candidateUserList,
        UserEntity? matchedUser,
      String? advertisementStatus}) {
    return AnnunciEntity(
        id: id ?? this.id,
        description: description ?? this.description,
        position: position ?? this.position,
        date: date ?? this.date,
        hourSlot: hourSlot ?? this.hourSlot,
        image: image ?? this.image,
        skill: skill ?? this.skill,
        payment: payment ?? this.payment,
        publisherUser: publisherUser ?? this.publisherUser,
        candidateUserList: candidateUserList ?? this.candidateUserList,
        matchedUser: matchedUser ?? this.matchedUser,
        advertisementStatus: advertisementStatus ?? this.advertisementStatus);
  }

  factory AnnunciEntity.fromJson(Map<String, dynamic> json) => AnnunciEntity(
      id: json["id"] ?? "",
      description: json["description"] ?? "",
      position: json["position"] ?? "",
      date: DateTime.parse(json["date"]),
      image: json["image"] ?? 'assets/images/img_pexelsphotoby.png',
      hourSlot: json["hourSlot"] ?? "",
      skill: json["skill"] != null
          ? SkillEntity.fromJson(json["skill"])
          : SkillEntity(),
      payment: json["payment"].toString(),
      publisherUser: json["publisherUser"] != null
          ? UserEntity.fromJson(json["publisherUser"])
          : UserEntity(),
      candidateUserList: json["candidateUserList"] ?? "",
      matchedUser: json["matchedUser"] != null
          ? UserEntity.fromJson(json["matchedUser"])
          : null,
      advertisementStatus: json["advertisementStatus"] ?? "");

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "position": position,
        "date": date.toIso8601String(),
        "hourSlot": hourSlot,
        "skill": skill?.toJson(),
        "payment": payment,
        "publisherUser": publisherUser?.toJson(),
        "candidateUserList": candidateUserList,
        "matchedUser": matchedUser?.toJson(),
        "advertisementStatus": advertisementStatus
      };

  factory AnnunciEntity.defaultVal() => AnnunciEntity(
      id: "",
      description: "",
      position: "",
      date: DateTime.now(),
      image: 'assets/images/img_pexelsphotoby.png',
      hourSlot: "",
      skill: SkillEntity(),
      payment: "",
      publisherUser: UserEntity(),
      candidateUserList: [],
      matchedUser: null,
      advertisementStatus: "");

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnnunciEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
