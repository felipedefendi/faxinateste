import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/profile/profile_text_field_component.dart';
import 'package:frontfaxina/app/components/profile/custom_dropdown_field_component.dart';
import 'package:frontfaxina/app/components/profile/save_button_component.dart';
import 'package:frontfaxina/app/core/utils/mock/user_info_mock.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  _PersonalInfoViewState createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _cpfController;
  late String _selectedGender;

  @override
  void initState() {
    super.initState();

    UserInfo userInfo = getMockUserInfo();

    _nameController = TextEditingController(text: userInfo.name);
    _surnameController = TextEditingController(text: userInfo.surname);
    _cpfController = TextEditingController(text: userInfo.cpf);
    _selectedGender = userInfo.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF28A745)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          "Informações pessoais",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF28A745),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileTextField(label: "Nome", controller: _nameController),
            const SizedBox(height: 16),
            ProfileTextField(
                label: "Sobrenome", controller: _surnameController),
            const SizedBox(height: 16),
            CustomDropdownField(
              label: "Sexo",
              selectedValue: _selectedGender,
              options: const ["Masculino", "Feminino", "Outros"],
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            ProfileTextField(label: "CPF", controller: _cpfController),
            const SizedBox(height: 32),
            SaveButton(onPressed: () {}),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
        onTabTapped: (index) {},
      ),
    );
  }
}
