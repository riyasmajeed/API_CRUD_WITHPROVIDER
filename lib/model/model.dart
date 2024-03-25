class SignUpBody {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String password;
  SignUpBody(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.password});

  factory SignUpBody.fromJson(Map<String, dynamic> json) {
    return SignUpBody(
        id: json['_id'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
    };
  }
}
