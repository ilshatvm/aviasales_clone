import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text("Авиабилеты")),
    Center(child: Text("Отели")),
    Center(child: Text("Короче")),
    Center(child: Text("Подписки")),
    Center(child: Text("Профиль")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviasales Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
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
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Icon(Icons.abc),
              ),
              label: "Авиабилеты",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Icon(Icons.abc),
              ),
              label: "Отели",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Icon(Icons.abc),
              ),
              label: "Короче",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Icon(Icons.abc),
              ),
              label: "Подписки",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Icon(Icons.abc),
              ),
              label: "Профиль",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) => _onItemTapped(index),
        ),
      ),
    );
  }
}
