

class Subscription {
  String? id;
  String? name;
  double? numAnnunci;
  double? numberOfDays;
  double? price;
  bool? searchEnabled;
  bool? createAdvertisementEnabled;

  Subscription({this.id, this.name, this.numAnnunci, this.numberOfDays, this.price, this.searchEnabled, this.createAdvertisementEnabled});


  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      numAnnunci: double.parse(json["numAnnunci"]) ?? 0,
      numberOfDays: double.parse(json["numberOfDays"]) ?? 0,
      price: double.parse(json["price"]) ?? 0,
      searchEnabled: json["searchEnabled"] ?? false,
      createAdvertisementEnabled: json["createAdvertisementEnabled"] ?? false
  );

}