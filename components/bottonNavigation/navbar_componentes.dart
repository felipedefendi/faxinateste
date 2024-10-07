import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  void _onTabSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        // Navigator.pushReplacementNamed(context, '/calendar');
        break;
      case 2:
        // Ícone central, pode não ter ação.
        break;
      case 3:
        // Navigator.pushReplacementNamed(context, '/alerts');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNavigationBar(
          onTap: (index) {
            _onTabSelected(context, index);
            onTabTapped(index);
          },
          currentIndex: currentIndex,
          selectedItemColor: const Color(0xFF00AC47),
          unselectedItemColor: const Color(0x9900AC47),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Calendário',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'Alertas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Perfil',
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: MediaQuery.of(context).size.width / 2 - 30,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.green, width: 4),
            ),
            child: Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(
                  'images/vassoura.png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
