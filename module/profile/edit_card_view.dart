import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/profile/profile_text_field_component.dart';
import 'package:frontfaxina/app/components/profile/save_button_component.dart';
import 'package:frontfaxina/app/components/profile/custom_dropdown_field_component.dart';

class EditCardView extends StatefulWidget {
  final Map<String, String> cardData;

  const EditCardView({super.key, required this.cardData});

  @override
  _EditCardViewState createState() => _EditCardViewState();
}

class _EditCardViewState extends State<EditCardView> {
  late TextEditingController _cardNumberController;
  late TextEditingController _expiryDateController;
  late TextEditingController _cvvController;
  late TextEditingController _holderNameController;
  late TextEditingController _holderCpfController;
  late TextEditingController _nicknameController;
  late String _selectedCardType;

  @override
  void initState() {
    super.initState();
    _cardNumberController =
        TextEditingController(text: widget.cardData['cardNumber']);
    _expiryDateController =
        TextEditingController(text: widget.cardData['expiryDate']);
    _cvvController = TextEditingController(text: widget.cardData['cvv']);
    _holderNameController =
        TextEditingController(text: widget.cardData['holderName']);
    _holderCpfController =
        TextEditingController(text: widget.cardData['holderCpf']);
    _nicknameController =
        TextEditingController(text: widget.cardData['nickname']);
    _selectedCardType = widget.cardData['cardType'] ?? 'Crédito';
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
          "Editar Cartão",
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
                controller: _nicknameController, label: "Apelido do cartão"),
            const SizedBox(height: 32),
            SaveButton(
              text: "Salvar alterações",
              onPressed: () {
                Navigator.pop(context, {
                  "type": _nicknameController.text,
                  "cardNumber": _cardNumberController.text,
                  "expiryDate": _expiryDateController.text,
                  "cvv": _cvvController.text,
                  "holderName": _holderNameController.text,
                  "holderCpf": _holderCpfController.text,
                  "nickname": _nicknameController.text,
                  "cardType": _selectedCardType,
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
