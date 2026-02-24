import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  final String? email;
  final String? instagram;
  final String? phoneNumber;

  const Footer({
    super.key,
    this.email,
    this.phoneNumber,
    this.instagram,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.teal.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.headset_mic_outlined,
                    color: Colors.teal, size: 16),
              ),
              const SizedBox(width: 8),
              const Text(
                'HUBUNGI KAMI',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (email != null) _ContactRow(
            icon: Icons.email_outlined,
            value: email!,
          ),
          if (instagram != null) _ContactRow(
            faIcon: FontAwesomeIcons.instagram,
            value: instagram!,
          ),
          if (phoneNumber != null) _ContactRow(
            icon: Icons.phone_outlined,
            value: phoneNumber!,
            isLast: true,
          ),
          const SizedBox(height: 8),
          const Divider(height: 1, thickness: 1),
          const SizedBox(height: 8),
          Center(
            child: Text(
              '© 2025 Kelurahan Maharatu · Kota Pekanbaru',
              style: TextStyle(
                fontSize: 11,
                color: Colors.blueGrey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData? icon;
  final IconData? faIcon;
  final String value;
  final bool isLast;

  const _ContactRow({
    this.icon,
    this.faIcon,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.teal.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: faIcon != null
                  ? FaIcon(faIcon, color: Colors.teal, size: 15)
                  : Icon(icon, color: Colors.teal, size: 17),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
