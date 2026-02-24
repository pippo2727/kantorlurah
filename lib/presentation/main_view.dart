import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/presentation/partials/app_logo_with_title_and_subtitle.dart';

class MainView extends StatelessWidget {
  String name;

  // List of carousel image
  final List<String> imgList = [
    'assets/image/image1.jpg',
    'assets/image/image2.jpg',
    'assets/image/image3.jpg',
  ];

  MainView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PELAYANANKU'),
        backgroundColor: const Color(0xff20B2AA),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLogoWithTitleAndSubtitle(),
              const SizedBox(
                height: 20.0,
              ),
              // Welcome header card
              const Text(
                'MENU LAYANAN',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: [
                  _MainMenuCard(
                    icon: Icons.assignment_outlined,
                    label: 'Informasi\nPersyaratan',
                    color: Colors.teal,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PersyaratanView(name: name),
                      ),
                    ),
                  ),
                  _MainMenuCard(
                    icon: Icons.report_problem_outlined,
                    label: 'Pengaduan\nMasyarakat',
                    color: Colors.orange,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PengaduanView(name: name),
                      ),
                    ),
                  ),
                  _MainMenuCard(
                    icon: Icons.access_time_outlined,
                    label: 'Jam\nPelayanan',
                    color: Colors.blue,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => WaktuView(name: name)),
                    ),
                  ),
                  _MainMenuCard(
                    icon: Icons.account_balance_outlined,
                    label: 'Profil\nKantor',
                    color: Colors.green,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ProfilView(name: name)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Footer(
                email: 'kelurahanmaharatu@gmail.com',
                instagram: ' kelurahanmaharatu',
                phoneNumber:
                    '+62 813-6566-4033 - Irvan Habibi\n +62 852-7221-3468 - Sigit Tri Haryanto',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainMenuCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _MainMenuCard({
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
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
