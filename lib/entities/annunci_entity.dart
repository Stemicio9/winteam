

class AnnunciEntity {

  final String id;
  final String title;
  final String description;
  final String date;
  final String hourSlot;
  final String skill;
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
    required this.skill,
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
    skill: json["skill"] ?? "",
    payment: json["payment"].toString() ?? "",
    publisherUserId: json["publisherUserId"] ?? "",
    candidateUserList: json["candidateUserList"] ?? "",
    matchedUserId: json["matchedUserId"] ?? "",
    advertisementStatus: json["advertisementStatus"] ?? ""

  );

}