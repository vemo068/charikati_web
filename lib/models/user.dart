class User {
  int? id;
  String username;
  String password;
  User({this.id, required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["name"],
        password: json["password"],
      );

   Map<String, dynamic> toJson() => {
        "id": id,
        "name": username,
        "password": password,
      };
}
