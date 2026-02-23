import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';

class UserMainNavigationView extends StatefulWidget {
  final String name;
  final String email;

  const UserMainNavigationView({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<UserMainNavigationView> createState() =>
      _UserMainNavigationViewState();
}

class _UserMainNavigationViewState extends State<UserMainNavigationView> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      MainView(name: widget.name),
      PengaduanView(name: widget.name),
      NavProfileTabView(name: widget.name, email: widget.email),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.report_outlined),
            selectedIcon: Icon(Icons.report),
            label: 'Pengaduan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
