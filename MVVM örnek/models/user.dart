class User {
  String name;
  int id;
  User({required this.name, required this.id});

  factory User.toUser(Map<String, dynamic> map) {
    return User(name: map["name"], id: map["id"]);
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name};
  }
}
