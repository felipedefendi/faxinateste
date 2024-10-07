// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  String country;
  String state;
  String city;
  String street;
  String number;
  String addiotional;
  String cep;
  String neighborhood;
  AddressModel({
    required this.country,
    required this.state,
    required this.city,
    required this.street,
    required this.number,
    required this.addiotional,
    required this.cep,
    required this.neighborhood,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'country': country,
      'state': state,
      'city': city,
      'street': street,
      'number': number,
      'addiotional': addiotional,
      'cep': cep,
      'neighborhood': neighborhood,
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      country: json['country'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      street: json['street'] as String,
      number: json['number'] as String,
      addiotional: json['addiotional'] as String,
      cep: json['cep'] as String,
      neighborhood: json['neighborhood'] as String,
    );
  }

  static List<AddressModel> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => AddressModel.fromJson(json)).toList();
  }
}
