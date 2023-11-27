import 'package:flutter/material.dart';
import 'package:provider_dzikir/screens/example.dart';
import 'package:provider_dzikir/screens/dashboard/v_dashboard.dart';

class ButtonNavBar extends StatefulWidget {
  @override
  State<ButtonNavBar> createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _selectedIndex = 0;

  final _pageOption = [
    DashboardKaryawan(),
    ExampleScreen(),
    ExampleScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF0a4f8f),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.white), label: 'About'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.white), label: 'Profile'),
          ]),
    );
  }
}
