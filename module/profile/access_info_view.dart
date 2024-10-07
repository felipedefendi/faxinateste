import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/profile/menu_item_component.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/module/profile/change_email_view.dart';
import 'package:frontfaxina/app/module/profile/change_pass_view.dart';
import 'package:frontfaxina/app/module/profile/change_phone_num_view.dart';

class AccessInfoView extends StatelessWidget {
  const AccessInfoView({super.key});

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
          "Informações de acesso",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF28A745),
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(),
          BuildMenuItem(
            icon: Icons.email_outlined,
            title: 'E-mail',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangeEmailView()),
              );
            },
          ),
          BuildMenuItem(
            icon: Icons.password_outlined,
            title: 'Senha',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangePasswordView()),
              );
            },
          ),
          BuildMenuItem(
            icon: Icons.contact_phone_outlined,
            title: 'Telefone',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChangePhoneNumView()),
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
