import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onTap,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'home',
                selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                label: 'explore',
                selectedIcon: Icon(Icons.explore),
            ),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                label: 'settings',
                selectedIcon: Icon(Icons.settings),
            ),
          ]
      ),
    );
  }
}