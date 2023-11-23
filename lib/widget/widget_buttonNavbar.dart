import 'package:flutter/material.dart';

class ButtonNavBar extends StatelessWidget {
  //const ButtonNavBar({super.key});

  final int currentIndex;
  final Function(int index) onTap;

  ButtonNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Color(0xFF0a4f8f),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.white), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.white), label: 'Profile'),
        ]);
  }
}
