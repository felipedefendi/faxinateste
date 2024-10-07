import 'package:flutter/material.dart';
import 'package:frontfaxina/app/service/addresses/addresses_service_impl.dart';

class AddressDrawer extends StatefulWidget {
  final AddressesServiceImpl addressesServiceImpl;
  final List<Map<String, String>> items;
  // final FeedProvider feedProvider;

  const AddressDrawer(
      {super.key,
      required this.items,
      // required this.feedProvider,
      required this.addressesServiceImpl});

  @override
  // ignore: library_private_types_in_public_api
  _AddressDrawerState createState() => _AddressDrawerState();
}

class _AddressDrawerState extends State<AddressDrawer> {
  List<Map<String, dynamic>> _addresses = [];

  @override
  void initState() {
    super.initState();
    _fetchAddresses();
  }

  Future<void> _fetchAddresses() async {
    try {
      final response = await widget.addressesServiceImpl.getAddress();
      if (response.statusCode == 200) {
        setState(() {
          _addresses = List<Map<String, dynamic>>.from(response.data);
        });
      }
    } catch (e) {
      throw Exception('Erro ao buscar endereços: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Meu(s) endereço(s)',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 300,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListView.builder(
            itemCount: _addresses.length + 1,
            itemBuilder: (context, index) {
              if (index == _addresses.length) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text(
                      'Adicionar novo endereço',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      print('Adicionar novo endereço');
                    },
                  ),
                );
              }
              final address = _addresses[index];
              return Card(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // widget.feedProvider.selectEndereco(
                        //   address['Street'],
                        //   address['Neighborhood'],
                        // );
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        title: Text(
                          address['Street'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          address['Neighborhood'],
                        ),
                        leading: const Icon(
                          Icons.location_on,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
