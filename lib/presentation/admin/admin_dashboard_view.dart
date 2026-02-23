import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/service/supabase_service.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  Future<void> _logout(BuildContext context) async {
    await SupabaseService.logout();
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const FirstView()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [primaryColor, Color(0xFF178F88)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.admin_panel_settings,
                        color: Colors.white, size: 30),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Selamat Datang, Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'admin@demo.com',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'MENU ADMIN',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: textMutedColor,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),

            // Menu grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                _AdminMenuCard(
                  icon: Icons.people_alt_outlined,
                  label: 'Manajemen\nPengguna',
                  color: Colors.teal,
                  onTap: () {},
                ),
                _AdminMenuCard(
                  icon: Icons.report_problem_outlined,
                  label: 'Pengaduan\nMasuk',
                  color: Colors.orange,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AdminPengaduanView(),
                      ),
                    );
                  },
                ),
                _AdminMenuCard(
                  icon: Icons.article_outlined,
                  label: 'Data\nPersyaratan',
                  color: Colors.blue,
                  onTap: () {},
                ),
                _AdminMenuCard(
                  icon: Icons.bar_chart_outlined,
                  label: 'Laporan &\nStatistik',
                  color: Colors.purple,
                  onTap: () {},
                ),
                _AdminMenuCard(
                  icon: Icons.settings_outlined,
                  label: 'Pengaturan\nAplikasi',
                  color: Colors.green,
                  onTap: () {},
                ),
                _AdminMenuCard(
                  icon: Icons.logout,
                  label: 'Keluar',
                  color: Colors.red,
                  onTap: () => _logout(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminMenuCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _AdminMenuCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: textPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
