import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/presentation/partials/edit_profile_view.dart';
import 'package:kantor_lurah/service/supabase_service.dart';

/// Shared Profile tab used by both user and admin bottom navigation.
class NavProfileTabView extends StatefulWidget {
  final String name;
  final String email;
  final bool isAdmin;

  const NavProfileTabView({
    super.key,
    required this.name,
    required this.email,
    this.isAdmin = false,
  });

  @override
  State<NavProfileTabView> createState() => _NavProfileTabViewState();
}
class _NavProfileTabViewState extends State<NavProfileTabView> {
  late String _displayName;
  DateTime? _birthDate;

  @override
  void initState() {
    super.initState();
    _displayName = widget.name;
    if (!widget.isAdmin) _loadProfile();
  }

  Future<void> _loadProfile() async {
    final data = await SupabaseService.fetchCurrentUserProfile();
    if (!mounted) return;
    setState(() {
      _displayName = data?['name'] as String? ?? widget.name;
      final bd = data?['birth_date'] as String?;
      if (bd != null) _birthDate = DateTime.tryParse(bd);
    });
  }

  Future<void> _openEditProfile() async {
    final updated = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => EditProfileView(
          initialName: _displayName,
          initialBirthDate: _birthDate,
        ),
      ),
    );
    if (updated == true) _loadProfile();
  }

  Future<void> _logout(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Keluar'),
        content: const Text('Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Keluar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await SupabaseService.logout();
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const FirstView()),
      (route) => false,
    );
  }

  String _initials(String n) {
    final parts = n.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return n.substring(0, n.length >= 2 ? 2 : n.length).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title:
            const Text('Profil', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Avatar + info ────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Text(
                      _initials(_displayName),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _displayName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.email,
                    style: const TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                  if (widget.isAdmin)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Administrator',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ── Edit profile ─────────────────────────────────────────────
            NavMenuSection(children: [
              NavProfileMenuItem(
                icon: Icons.edit_outlined,
                label: 'Edit Profil',
                onTap: widget.isAdmin ? () {} : _openEditProfile,
              ),
            ]),
            const SizedBox(height: 12),

            // ── Legal ─────────────────────────────────────────────────────
            NavMenuSection(children: [
              NavProfileMenuItem(
                icon: Icons.description_outlined,
                label: 'Syarat & Ketentuan',
                onTap: () {
                  // TODO: navigate to TOS
                },
              ),
              const Divider(height: 1, indent: 56),
              NavProfileMenuItem(
                icon: Icons.privacy_tip_outlined,
                label: 'Kebijakan Privasi',
                onTap: () {
                  // TODO: navigate to Privacy Policy
                },
              ),
            ]),
            const SizedBox(height: 12),

            // ── Logout ────────────────────────────────────────────────────
            NavMenuSection(children: [
              NavProfileMenuItem(
                icon: Icons.logout,
                label: 'Keluar',
                labelColor: Colors.red,
                iconColor: Colors.red,
                onTap: () => _logout(context),
              ),
            ]),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Reusable section card
// ---------------------------------------------------------------------------
class NavMenuSection extends StatelessWidget {
  final List<Widget> children;

  const NavMenuSection({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

// ---------------------------------------------------------------------------
// Reusable menu item row
// ---------------------------------------------------------------------------
class NavProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? labelColor;
  final Color? iconColor;
  final VoidCallback onTap;

  const NavProfileMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.labelColor,
    this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? Colors.teal, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 15, color: labelColor ?? Colors.black87),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20),
          ],
        ),
      ),
    );
  }
}
