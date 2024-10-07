import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/profile/profile_header_component.dart';
import 'package:frontfaxina/app/components/profile/wallet_add_button_component.dart';
import 'package:frontfaxina/app/components/profile/wallet_balance_component.dart';
import 'package:frontfaxina/app/components/profile/wallet_card_component.dart';
import 'package:frontfaxina/app/core/utils/mock/wallet_mock.dart';
import 'package:frontfaxina/app/module/profile/add_card_view.dart';
import 'edit_card_view.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  late List<Map<String, String>> cards;

  @override
  void initState() {
    super.initState();
    cards = getCardsMock();
  }

  void addNewCard(Map<String, String> newCard) {
    setState(() {
      cards.add(newCard);
    });
  }

  void updateCard(int index, Map<String, String> updatedCard) {
    setState(() {
      cards[index] = updatedCard;
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
          "Carteira",
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
          const SizedBox(height: 8),
          WalletBalanceComponent(balance: getBalanceMock()),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Formas de Pagamento",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF28A745),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ...cards.asMap().entries.map((entry) {
                      int index = entry.key;
                      Map<String, String> card = entry.value;
                      return WalletCardComponent(
                        card: card,
                        onEditPressed: () async {
                          final updatedCard = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditCardView(cardData: card),
                            ),
                          );
                          if (updatedCard != null) {
                            updateCard(index, updatedCard);
                          }
                        },
                        onDeletePressed: () {
                          setState(() {
                            cards.removeAt(index);
                          });
                        },
                      );
                    }),
                    const Divider(),
                    AddNewCardButton(
                      onPressed: () async {
                        final newCard = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddCardView()),
                        );
                        if (newCard != null) {
                          addNewCard(newCard);
                        }
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
        currentIndex: 3,
        onTabTapped: (index) {
          // Ação de navegação ao trocar de aba
        },
      ),
    );
  }
}
