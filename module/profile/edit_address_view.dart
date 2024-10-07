import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/profile/address_button_component.dart';
import 'package:frontfaxina/app/components/profile/profile_header_component.dart';
import 'package:frontfaxina/app/components/profile/profile_text_field_component.dart';
import 'package:frontfaxina/app/core/utils/mock/profile_address_mock.dart';

class EditAddressView extends StatefulWidget {
  final Map<String, dynamic> addressData;

  const EditAddressView({super.key, required this.addressData});

  @override
  State<EditAddressView> createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  late TextEditingController _streetController;
  late TextEditingController _numberController;
  late TextEditingController _cepController;
  late TextEditingController _neighborhoodController;
  late TextEditingController _complementController;
  late TextEditingController _nicknameController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;

  @override
  void initState() {
    super.initState();
    _streetController =
        TextEditingController(text: widget.addressData['street']);
    _numberController =
        TextEditingController(text: widget.addressData['number']);
    _cepController = TextEditingController(text: widget.addressData['zipCode']);
    _neighborhoodController =
        TextEditingController(text: widget.addressData['neighborhood']);
    _complementController =
        TextEditingController(text: widget.addressData['complement']);
    _nicknameController =
        TextEditingController(text: widget.addressData['title']);
    _cityController = TextEditingController(text: widget.addressData['city']);
    _stateController = TextEditingController(text: widget.addressData['state']);
  }

  @override
  void dispose() {
    _streetController.dispose();
    _numberController.dispose();
    _cepController.dispose();
    _neighborhoodController.dispose();
    _complementController.dispose();
    _nicknameController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    super.dispose();
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
          "Editar Endereço",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF28A745),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(
              imagePath: 'images/emanoelli.png',
              userName: 'Emanoelli Galheri',
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ProfileTextField(
                    label: "Estado",
                    controller: _stateController,
                  ),
                  const SizedBox(height: 10),
                  ProfileTextField(
                    label: "Cidade",
                    controller: _cityController,
                  ),
                  const SizedBox(height: 10),
                  ProfileTextField(
                    label: "Rua, Avenida, etc.",
                    controller: _streetController,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileTextField(
                          label: "Número",
                          controller: _numberController,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ProfileTextField(
                          label: "CEP",
                          controller: _cepController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ProfileTextField(
                    label: "Bairro",
                    controller: _neighborhoodController,
                  ),
                  const SizedBox(height: 10),
                  ProfileTextField(
                    label: "Complemento",
                    controller: _complementController,
                  ),
                  const SizedBox(height: 10),
                  ProfileTextField(
                    label: "Apelido do endereço",
                    controller: _nicknameController,
                  ),
                  const SizedBox(height: 30),
                  AddressButton(
                    text: "Salvar Alterações",
                    onPressed: () {
                      final updatedAddress = {
                        'id': widget.addressData['id'],
                        'title': _nicknameController.text,
                        'street': _streetController.text,
                        'number': _numberController.text,
                        'neighborhood': _neighborhoodController.text,
                        'city': _cityController.text,
                        'state': _stateController.text,
                        'zipCode': _cepController.text,
                        'complement': _complementController.text,
                        'isPrimary': widget.addressData['isPrimary'],
                      };

                      ProfileAddressMock.updateAddress(updatedAddress);

                      Navigator.pop(context, updatedAddress);
                    },
                  ),
                ],
              ),
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
