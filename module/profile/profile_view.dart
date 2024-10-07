import 'package:flutter/material.dart';
import 'package:frontfaxina/app/module/home/home_view.dart';
import 'package:frontfaxina/app/module/profile/addresses_view.dart';
import 'package:frontfaxina/app/module/profile/cleaning_hist_view.dart';
import 'package:frontfaxina/app/module/profile/finance_history_view.dart';
import 'package:frontfaxina/app/module/profile/wallet_view.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/drawer/custom_drawer.dart';
import 'package:frontfaxina/app/components/profile/profile_header_component.dart';
import 'package:frontfaxina/app/components/profile/menu_item_component.dart';
import 'package:frontfaxina/app/module/profile/account_details_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int _currentIndex = 4;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
        break;
      case 1:
        print('Tela de calendário');
        break;
      case 2:
        print('Tela de notificações');
        break;
      case 3:
        print('Tela de notificações');
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileView()),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Perfil",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF28A745),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          const ProfileHeader(
            imagePath: 'images/emanoelli.png',
            userName: 'Emanoelli Galheri',
          ),
          const Divider(),
          BuildMenuItem(
            icon: Icons.person_outline,
            title: 'Minha conta',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AccountDetailsView()),
              );
            },
          ),
          BuildMenuItem(
            icon: Icons.history,
            title: 'Histórico de Faxinas',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CleaningHistoryView()),
              );
            },
          ),
          BuildMenuItem(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Carteira',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WalletView()),
              );
            },
          ),
          BuildMenuItem(
            icon: Icons.receipt_long_outlined,
            title: 'Histórico Financeiro',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FinanceHistoryView()),
              );
            },
          ),
          BuildMenuItem(
            icon: Icons.location_on_outlined,
            title: 'Endereços',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddressesView()),
              );
            },
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
