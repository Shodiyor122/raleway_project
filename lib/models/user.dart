class User {
  int? id;
  String? name;
  String? phone;
  String? username;
  Map<String, dynamic>? werehouse;

  User({this.id, this.name, this.phone, this.username, this.werehouse});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      username: json["username"],
      werehouse: json["werehouse"]);

  Map<String, dynamic> get toJson =>
      {"name": name, "phone": phone, "username": username};
}
