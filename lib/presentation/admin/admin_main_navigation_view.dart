import 'package:flutter/material.dart';
import 'package:kantor_lurah/presentation/admin/admin_dashboard_view.dart';
import 'package:kantor_lurah/presentation/admin/admin_pengaduan_view.dart';
import 'package:kantor_lurah/presentation/partials/nav_profile_tab_view.dart';

class AdminMainNavigationView extends StatefulWidget {
  const AdminMainNavigationView({super.key});

  @override
  State<AdminMainNavigationView> createState() =>
      _AdminMainNavigationViewState();
}

class _AdminMainNavigationViewState extends State<AdminMainNavigationView> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const AdminDashboardView(),
      const AdminPengaduanView(),
      const NavProfileTabView(
        name: 'Admin',
        email: 'admin@demo.com',
        isAdmin: true,
      ),
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
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
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
