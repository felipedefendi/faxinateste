import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/profile/profile_text_field_component.dart';
import 'package:frontfaxina/app/components/profile/save_button_component.dart';

class ChangePhoneNumView extends StatefulWidget {
  const ChangePhoneNumView({super.key});

  @override
  _ChangePhoneNumViewState createState() => _ChangePhoneNumViewState();
}

class _ChangePhoneNumViewState extends State<ChangePhoneNumView> {
  final TextEditingController _phoneController =
      TextEditingController(text: "(11) 91234-5678");

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
          "Telefone",
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
            ProfileTextField(
              controller: _phoneController,
              label: "Telefone",
            ),
            const SizedBox(height: 32),
            SaveButton(
              onPressed: () {},
              text: "Alterar telefone",
            ),
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
