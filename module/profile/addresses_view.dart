import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/profile/address_button_component.dart';
import 'package:frontfaxina/app/components/profile/address_item_component.dart';
import 'package:frontfaxina/app/components/profile/profile_header_component.dart';
import 'package:frontfaxina/app/service/addresses/addresses_service_impl.dart';
import 'package:frontfaxina/app/core/utils/mock/profile_address_mock.dart';
import 'package:frontfaxina/app/module/profile/add_address_view.dart';
import 'package:frontfaxina/app/module/profile/edit_address_view.dart';

class AddressesView extends StatefulWidget {
  const AddressesView({super.key});

  @override
  State<AddressesView> createState() => _AddressesViewState();
}

class _AddressesViewState extends State<AddressesView> {
  final AddressesServiceImpl _addressesServiceImpl = AddressesServiceImpl();

  @override
  void initState() {
    super.initState();
    _addressesServiceImpl.getAddress();
  }

  List<Map<String, dynamic>> addresses = ProfileAddressMock.getAddresses();
  int? selectedAddressId;

  void _addNewAddress(Map<String, dynamic> newAddress) {
    setState(() {
      addresses.add(newAddress);
    });
  }

  void _selectAddress(int id) {
    setState(() {
      selectedAddressId = id;
    });
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
          "Endereços",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF28A745),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const ProfileHeader(
            imagePath: 'images/emanoelli.png',
            userName: 'Emanoelli Galheri',
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Endereços cadastrados:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey[300]!),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: addresses.length,
                        itemBuilder: (context, index) {
                          final address = addresses[index];
                          return AddressItemComponent(
                            address: address,
                            isSelected: address['id'] == selectedAddressId,
                            onEdit: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditAddressView(addressData: address),
                                ),
                              ).then((updatedAddress) {
                                if (updatedAddress != null) {
                                  setState(() {
                                    ProfileAddressMock.updateAddress(
                                        updatedAddress);
                                    addresses =
                                        ProfileAddressMock.getAddresses();
                                  });
                                }
                              });
                            },
                            onDelete: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Deletar Endereço'),
                                  content: const Text(
                                      'Tem certeza que deseja remover este endereço?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        ProfileAddressMock.removeAddress(
                                            address);
                                        setState(() {
                                          addresses.remove(address);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Deletar'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onSelect: (isSelected) {
                              _selectAddress(address['id']);
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    AddressButton(
                      text: "Adicionar um novo endereço",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddAddressView(
                              addressesServiceImpl: AddressesServiceImpl(),
                            ),
                          ),
                        ).then((newAddress) {
                          if (newAddress != null) {
                            _addNewAddress(newAddress);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
        onTabTapped: (index) {},
      ),
    );
  }
}
