class UserInfo {
  final String name;
  final String surname;
  final String cpf;
  final String gender;

  UserInfo({
    required this.name,
    required this.surname,
    required this.cpf,
    required this.gender,
  });
}

UserInfo getMockUserInfo() {
  return UserInfo(
    name: 'Emanoelli',
    surname: 'Galheri',
    cpf: '943.834.435-06',
    gender: 'Feminino',
  );
}
