import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/presentation/menu/pengaduan/input_pengaduan_view.dart';
import 'package:kantor_lurah/presentation/menu/pengaduan/my_pengaduan_view.dart';

class PengaduanView extends StatelessWidget {
  final String name;

  const PengaduanView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'PENGADUAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Halo, $name 👋',
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    _MenuCard(
                      icon: Icons.add_comment_outlined,
                      title: 'Buat Pengaduan Baru',
                      subtitle: 'Sampaikan keluhan atau laporan Anda',
                      color: Colors.teal,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              InputPengaduanView(name: name),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _MenuCard(
                      icon: Icons.list_alt_outlined,
                      title: 'Pengaduan Saya',
                      subtitle:
                          'Lihat daftar pengaduan yang pernah Anda buat',
                      color: Colors.blue,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyPengaduanView(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black38),
          ],
        ),
      ),
    );
  }
}
