


class UserEntity {

  final String name;
  final String email;

  const UserEntity({
    required this.name,
    required this.email
  });


  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
      name: "nome",
      email: json["email"]);

}