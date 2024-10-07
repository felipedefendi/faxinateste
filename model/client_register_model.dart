// ignore_for_file: public_member_api_docs, sort_constructors_first

class ClientRegisterModel {
  String? name;
  String? email;
  String? phone;
  String? type;
  String? cpf;
  String? password;
  String? gender;
  DateTime? birthdate;
  ClientRegisterModel({
    this.name,
    this.email,
    this.phone,
    this.type,
    this.cpf,
    this.password,
    this.gender,
    this.birthdate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'type': type,
      'cpf': cpf,
      'password': password,
      'gender': gender,
      'birthdate': birthdate!.toIso8601String(),
    };
  }

  factory ClientRegisterModel.fromJson(Map<String, dynamic> json) {
    return ClientRegisterModel(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      type: json['type'] as String,
      cpf: json['cpf'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
    );
  }
}
