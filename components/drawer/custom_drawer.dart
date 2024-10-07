import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? userName;

  final storage = const FlutterSecureStorage();

  dynamic userPerson;

  @override
  void initState() {
    super.initState();
    _fetchStoredValues();
  }

  Future<void> _fetchStoredValues() async {
    String? jsonBody = await storage.read(key: 'person');
    if (jsonBody != null) {
      setState(() {
        userPerson = jsonDecode(jsonBody);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 270,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/logo-escrita.png'),
                  const SizedBox(
                    width: 75,
                    height: 75,
                    child: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userPerson != null ? userPerson['Name'] ?? 'User' : 'User',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 5),
                    Text('Configurações'),
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    await storage.delete(key: 'token');
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login', (Route<dynamic> route) => false);
                  },
                  child: const Text('Sair'),
                ),
                TextButton(
                  onPressed: () async {
                    await _fetchStoredValues();
                  },
                  child: const Text('Atualizar Dados'),
                ),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
