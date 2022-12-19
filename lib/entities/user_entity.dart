import 'package:winteam/entities/skill_entity.dart';

class UserEntity {
  String? id;
  String? firstName;
  String? lastName;
  String? roleId;
  String? email;
  String? description;
  String? brief;
  List<SkillEntity>? skillList;
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
  String? companyName;

  UserEntity(
      {this.id,
      this.lastName,
      this.roleId,
      this.description,
      this.brief,
      this.skillList,
      this.availabilityDays,
      this.availabilityHourSlots,
      this.availabilityCities,
      this.address,
      this.city,
      this.province,
      this.nation,
      this.phoneNumber,
      this.imageLink,
      this.contatoreAnnunci,
      this.subscriptionId,
      this.lastSubscriptionDate,
      this.companyTypeId,
      this.verified,
      this.influencedUserList,
      this.enabledAnnunci,
      this.firstName,
      this.email,
      this.companyName});

  //toString
  @override
  String toString() {
    return 'UserEntity{id: $id, firstName: $firstName, lastName: $lastName, roleId: $roleId, email: $email, description: $description, brief: $brief, skillList: $skillList, availabilityDays: $availabilityDays, availabilityHourSlots: $availabilityHourSlots, availabilityCities: $availabilityCities, address: $address, city: $city, province: $province, nation: $nation, phoneNumber: $phoneNumber, imageLink: $imageLink, contatoreAnnunci: $contatoreAnnunci, subscriptionId: $subscriptionId, lastSubscriptionDate: $lastSubscriptionDate, companyTypeId: $companyTypeId, verified: $verified, influencedUserList: $influencedUserList, enabledAnnunci: $enabledAnnunci, companyName: $companyName}';
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
      id: json["id"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      email: json["email"] ?? "",
      roleId: json["roleId"] ?? "",
      skillList: json["skillList"] != null
          ? (json["skillList"] as List<dynamic>)
              .map((e) =>
                  SkillEntity.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList()
          : [],
      description: json["description"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      imageLink: json["imageLink"] ?? "",
      companyName: json['companyName'] ?? "",
      address: json['address'] ?? "");

  UserEntity copyWith({
      String? id,
      String? firstName,
      String? lastName,
      String? roleId,
      String? email,
      String? description,
      String? brief,
      List<SkillEntity>? skillList,
      List<String>? availabilityDays,
      List<String>? availabilityHourSlots,
      List<String>? availabilityCities,
      String? address,
      String? city,
      String? province,
      String? nation,
      String? phoneNumber,
      String? imageLink,
      int? contatoreAnnunci,
      String? subscriptionId,
      DateTime? lastSubscriptionDate,
      List<String>? companyTypeId,
      bool? verified,
      List<String>? influencedUserList,
      bool? enabledAnnunci,
      String? companyName}) {
    return UserEntity(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        roleId: roleId ?? this.roleId,
        email: email ?? this.email,
        description: description ?? this.description,
        brief: brief ?? this.brief,
        skillList: skillList ?? this.skillList,
        availabilityDays: availabilityDays ?? this.availabilityDays,
        availabilityHourSlots: availabilityHourSlots ?? this.availabilityHourSlots,
        availabilityCities: availabilityCities ?? this.availabilityCities,
        address: address ?? this.address,
        city: city ?? this.city,
        province: province ?? this.province,
        nation: nation ?? this.nation,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        imageLink: imageLink ?? this.imageLink,
        contatoreAnnunci: contatoreAnnunci ?? this.contatoreAnnunci,
        subscriptionId: subscriptionId ?? this.subscriptionId,
        lastSubscriptionDate: lastSubscriptionDate ?? this.lastSubscriptionDate,
        companyTypeId: companyTypeId ?? this.companyTypeId,
        verified: verified ?? this.verified,
        influencedUserList: influencedUserList ?? this.influencedUserList,
        enabledAnnunci: enabledAnnunci ?? this.enabledAnnunci,
        companyName: companyName ?? this.companyName);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "roleId": roleId,
        "email": email,
        "description": description,
        "brief": brief,
        "skillList": skillList?.map((e) => e.toJson()).toList(),
        "availabilityDays": availabilityDays,
        "availabilityHourSlots": availabilityHourSlots,
        "availabilityCities": availabilityCities,
        "address": address,
        "city": city,
        "province": province,
        "nation": nation,
        "phoneNumber": phoneNumber,
        "imageLink": imageLink,
        "contatoreAnnunci": contatoreAnnunci,
        "subscriptionId": subscriptionId,
        "lastSubscriptionDate": lastSubscriptionDate,
        "companyTypeId": companyTypeId,
        "verified": verified,
        "influencedUserList": influencedUserList,
        "enabledAnnunci": enabledAnnunci,
        "companyName": companyName
      };
}
