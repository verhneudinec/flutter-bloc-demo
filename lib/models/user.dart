class User {
  int id;
  String name;
  String email;
  String phone;

  User({this.id, this.email, this.name, this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}
