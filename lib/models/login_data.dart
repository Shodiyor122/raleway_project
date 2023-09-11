class LoginData {
  String? token;
  String? username;
  String? role;
  bool? status;

  LoginData({this.token, this.username, this.role, this.status});

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
      token: json["token"],
      username: json["username"],
      role: json["role"],
      status: json["status"]);
}
