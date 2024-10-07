class LoginModel {
  String? email;
  String? password;
  LoginModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] != null ? json['email'] as String : null,
      password: json['password'] != null ? json['password'] as String : null,
    );
  }
}
