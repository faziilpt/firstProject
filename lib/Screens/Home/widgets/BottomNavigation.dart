import 'package:flutter/material.dart';
import 'package:money_management/Screens/Home/home.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomeScreen.selectIndexNotifier,
      builder: (BuildContext ctx, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Colors.purple,
          currentIndex: updatedIndex,
          onTap: (newIndex) {
            HomeScreen.selectIndexNotifier.value = newIndex;
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Transactions'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories')
          ],
        );
      },
    );
  }
}
