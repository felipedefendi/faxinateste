import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/bottonNavigation/navbar_componentes.dart';
import 'package:frontfaxina/app/components/profile/profile_header_component.dart';
import 'package:frontfaxina/app/core/utils/mock/cleaning_hist_mock.dart';
import 'package:frontfaxina/app/components/profile/cleaning_hist_card_component.dart';

class CleaningHistoryView extends StatefulWidget {
  const CleaningHistoryView({super.key});

  @override
  _CleaningHistoryViewState createState() => _CleaningHistoryViewState();
}

class _CleaningHistoryViewState extends State<CleaningHistoryView> {
  @override
  Widget build(BuildContext context) {
    final cleaningHistory = getCleaningHistoryMock();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF28A745)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          "Histórico de Faxinas",
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
          Expanded(
            child: ListView.builder(
              itemCount: cleaningHistory.length,
              itemBuilder: (context, index) {
                final history = cleaningHistory[index];
                return CleaningCard(history: history);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
        onTabTapped: (index) {},
      ),
    );
  }
}
