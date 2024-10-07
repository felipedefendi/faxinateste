import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/profile/profile_text_field_component.dart';
import 'package:frontfaxina/app/components/profile/save_button_component.dart';
import 'package:frontfaxina/app/components/profile/custom_dropdown_field_component.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  _AddCardViewState createState() {
    return _AddCardViewState();
  }
}

class _AddCardViewState extends State<AddCardView> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _holderNameController = TextEditingController();
  final TextEditingController _holderCpfController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  String _selectedCardType = "Crédito";

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
          "Novo Cartão",
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
          children: [
            CustomDropdownField(
              label: "Tipo do Cartão",
              selectedValue: _selectedCardType,
              options: const ["Crédito", "Débito"],
              onChanged: (value) {
                setState(() {
                  _selectedCardType = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            ProfileTextField(
                controller: _cardNumberController, label: "Número do Cartão"),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ProfileTextField(
                      controller: _expiryDateController,
                      label: "Data de validade"),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ProfileTextField(
                      controller: _cvvController, label: "CVV"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ProfileTextField(
                controller: _holderNameController, label: "Nome do titular"),
            const SizedBox(height: 16),
            ProfileTextField(
                controller: _holderCpfController,
                label: "CPF / CNPJ do titular"),
            const SizedBox(height: 16),
            ProfileTextField(
                controller: _nicknameController,
                label: "Apelido do cartão (opcional)"),
            const SizedBox(height: 32),
            SaveButton(
              text: "Adicionar cartão",
              onPressed: () {
                Navigator.pop(context, {
                  "type": "$_selectedCardType - ${_nicknameController.text}",
                });
              },
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
