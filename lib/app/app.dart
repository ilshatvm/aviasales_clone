import 'package:aviasales_clone/app/app_navbar.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviasales Clone',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // ignore: prefer_const_constructors
        colorScheme: ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.blue,
        ),
        fontFamily: "SFPro",
        useMaterial3: true,
      ),
      home: const AppNavBar(),
    );
  }
}
