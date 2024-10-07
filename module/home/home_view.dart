import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/service/addresses/addresses_service_impl.dart';
import 'package:frontfaxina/app/components/drawer/address_drawer.dart';
import 'package:frontfaxina/app/components/drawer/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? userID;
  final storage = const FlutterSecureStorage();
  dynamic userPerson;

  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;
  bool _isFilterVisible = false;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddressDrawer(
          items: const [],
          addressesServiceImpl: AddressesServiceImpl(),
        );
      },
    );
  }

  void _toggleFilterVisibility() {
    setState(() {
      _isFilterVisible = !_isFilterVisible;
    });
  }

  int maxDistance = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            InkWell(
              onTap: _openBottomSheet,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      '',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: _toggleFilterVisibility,
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isFilterVisible ? 210.0 : 0.0,
            color: Colors.grey[200],
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    title: const Text(
                      'Distância Máxima (km)',
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Slider(
                      value: maxDistance.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          maxDistance = value.toInt();
                        });
                      },
                      max: 50,
                      divisions: 100,
                    ),
                  ),
                  const Divider(),
                  const Divider(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: const Text(''),
                  subtitle: const Text(
                    '',
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }
}
