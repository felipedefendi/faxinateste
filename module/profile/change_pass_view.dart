import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/profile/profile_text_field_component.dart';
import 'package:frontfaxina/app/components/profile/save_button_component.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
          "Alterar Senha",
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
            const SizedBox(height: 8),
            ProfileTextField(
              controller: _currentPasswordController,
              label: "Digite a sua senha atual",
              obscureText: true,
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 8),
            ProfileTextField(
              controller: _newPasswordController,
              label: "Digite sua nova senha",
              obscureText: true,
            ),
            const SizedBox(height: 8),
            ProfileTextField(
              controller: _confirmPasswordController,
              label: "Confirmar nova senha",
              obscureText: true,
            ),
            const SizedBox(height: 32),
            SaveButton(onPressed: () {
              if (_newPasswordController.text ==
                  _confirmPasswordController.text) {
              } else {}
            }),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
        onTabTapped: (index) {},
      ),
    );
  }
}
