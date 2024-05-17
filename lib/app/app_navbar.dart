import 'package:aviasales_clone/common/app_icons.dart';
import 'package:flutter/material.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text("Авиабилеты")),
    Center(child: Text("Отели")),
    Center(child: Text("Короче")),
    Center(child: Text("Подписки")),
    Center(child: Text("Профиль")),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Icon(AppIcons.air_ticket),
            ),
            label: "Авиабилеты",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Icon(AppIcons.hotel),
            ),
            label: "Отели",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Icon(AppIcons.location),
            ),
            label: "Короче",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Icon(AppIcons.subscriptions),
            ),
            label: "Подписки",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Icon(AppIcons.profile),
            ),
            label: "Профиль",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) => _onTap(index),
      ),
    );
  }
}
