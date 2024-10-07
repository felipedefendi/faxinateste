import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/profile/address_button_component.dart';
import 'package:frontfaxina/app/components/profile/profile_text_field_component.dart';
import 'package:frontfaxina/app/service/addresses/addresses_service_impl.dart';

class AddAddressView extends StatefulWidget {
  final AddressesServiceImpl addressesServiceImpl;
  const AddAddressView({super.key, required this.addressesServiceImpl});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

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
          "Novo Endereço",
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ProfileTextField(
                    label: "Cidade",
                    controller: _cityController,
                  ),
                  const SizedBox(height: 10),
                  ProfileTextField(
                    label: "Estado",
                    controller: _stateController,
                  ),
                  ProfileTextField(
                    label: "País",
                    controller: _countryController,
                  ),
                  const SizedBox(height: 10),
                  ProfileTextField(
                    label: "Nome da rua, avenida, etc",
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
                    label: "Complemento. Exemplo: Casa, Apartamento 101",
                    controller: _complementController,
                  ),
                  const SizedBox(height: 10),
                  ProfileTextField(
                    label: "Apelido do endereço",
                    controller: _nicknameController,
                  ),
                  const SizedBox(height: 30),
                  AddressButton(
                      text: "Adicionar Endereço",
                      onPressed: () {
                        widget.addressesServiceImpl.postAddress(
                          country: _countryController.text,
                          state: _stateController.text,
                          city: _cityController.text,
                          street: _streetController.text,
                          number: _numberController.text,
                          additional: _complementController.text,
                          cep: _cepController.text,
                          neighborhood: _neighborhoodController.text,
                        );
                      }),
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
