import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/profile/menu_item_component.dart';
import 'package:frontfaxina/app/components/profile/profile_header_component.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/module/profile/access_info_view.dart';
import 'package:frontfaxina/app/module/profile/personal_info_view.dart';

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF28A745)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text(
          "Minha conta",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF28A745),
          ),
        ),
      ),
      body: Column(
        children: [
          const ProfileHeader(
            imagePath: 'images/emanoelli.png',
            userName: 'Emanoelli Galheri',
          ),
          const Divider(),
          BuildMenuItem(
            icon: Icons.person_outline,
            title: 'Informações Pessoais',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PersonalInfoView()),
              );
            },
          ),
          BuildMenuItem(
            icon: Icons.lock_outline,
            title: 'Informações de acesso',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccessInfoView()),
              );
            },
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
