class User {
  String id;
  String email;
  String password;
  String name;
  String role;
  String avatar;
  User(this.id, this.email, this.password, this.name, this.role, this.avatar);
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json["id"].toString(),
        json["email"].toString(),
        json["password"].toString(),
        json["name"].toString(),
        json["role"].toString(),
        json["avatar"].toString());
  }
}
