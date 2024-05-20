// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey<String>('AppNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.grey1,
              width: 1.0,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10.0,
          unselectedFontSize: 10.0,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.grey6,
          items: const <BottomNavigationBarItem>[
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
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => _onTap(context, index),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
