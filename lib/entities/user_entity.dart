
import 'package:winteam/entities/skill_lavoratore.dart';

class UserEntity {

  String? id;
  String? firstName;
  String? lastName;
  String? roleId;
  String? email;
  String? description;
  String? brief;
  List<SkillLavoratore>? skillList;
  List<String>? availabilityDays;
  List<String>? availabilityHourSlots;
  List<String>? availabilityCities;
  String? address;
  String? city;
  String? province;
  String? nation;
  String? phoneNumber;
  String? imageLink;
  int? contatoreAnnunci;
  String? subscriptionId;
  DateTime? lastSubscriptionDate;
  List<String>? companyTypeId;
  bool? verified;
  List<String>? influencedUserList;
  bool? enabledAnnunci;

   UserEntity({this.id, this.lastName, this.roleId,
      this.description, this.brief, this.skillList,
      this.availabilityDays, this.availabilityHourSlots,
      this.availabilityCities, this.address, this.city,
      this.province, this.nation, this.phoneNumber,
      this.imageLink, this.contatoreAnnunci, this.subscriptionId,
      this.lastSubscriptionDate, this.companyTypeId, this.verified,
      this.influencedUserList, this.enabledAnnunci, this.firstName,
      this.email});


  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
      id: json["id"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      email: json["email"] ?? "",
      roleId: json["roleId"] ?? "",
      skillList: (json["skillList"] as List<dynamic>).map((e) => SkillLavoratore.fromJson(Map<String, dynamic>.from(e as Map))).toList(),
      description: json["description"] ?? "",
      phoneNumber: json["phoneNumber"] ?? ""
  );
}