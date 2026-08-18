import 'package:flutter/material.dart';
import 'money_screen.dart';
import 'card_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // 1 is the Money screen (center tab)
  int _currentIndex = 1;

  final List<Widget> _screens = [
    const CardScreen(), // Index 0: Home/Card
    const MoneyScreen(), // Index 1: Money ($)
    const Center(child: Text('History Screen (Not Implemented)')), // Index 2: Time
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_outlined, size: 30),
            activeIcon: Icon(Icons.account_balance, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Text(
              '\$',
              style: TextStyle(fontSize: 30, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            activeIcon: Text(
              '\$',
              style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            label: 'Money',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time, size: 30),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
