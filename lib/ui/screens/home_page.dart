import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("asd"),
      ),
      // backgroundColor: Colors.red,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: false,
        itemCornerRadius: 24,
        curve: Curves.easeInCubic,
        iconSize: 20,
        containerHeight: 50,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.apps),
            title: const Text(
              'Мои вакансии',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
            activeColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.people),
            title: const Text(
              'Отклики',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
            activeColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.message),
            title: const Text(
              'Messages test for mes teset test test ',
            ),
            activeColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Настройки'),
            activeColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
