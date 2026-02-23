import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Status enum
// ---------------------------------------------------------------------------
enum PengaduanStatus { menunggu, diproses, selesai, ditolak }

extension PengaduanStatusX on PengaduanStatus {
  String get label {
    switch (this) {
      case PengaduanStatus.menunggu:
        return 'Menunggu';
      case PengaduanStatus.diproses:
        return 'Diproses';
      case PengaduanStatus.selesai:
        return 'Selesai';
      case PengaduanStatus.ditolak:
        return 'Ditolak';
    }
  }

  Color get color {
    switch (this) {
      case PengaduanStatus.menunggu:
        return Colors.orange;
      case PengaduanStatus.diproses:
        return Colors.blue;
      case PengaduanStatus.selesai:
        return Colors.green;
      case PengaduanStatus.ditolak:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case PengaduanStatus.menunggu:
        return Icons.hourglass_empty;
      case PengaduanStatus.diproses:
        return Icons.sync;
      case PengaduanStatus.selesai:
        return Icons.check_circle;
      case PengaduanStatus.ditolak:
        return Icons.cancel;
    }
  }
}

PengaduanStatus pengaduanStatusFromString(String value) {
  return PengaduanStatus.values.firstWhere(
    (e) => e.name == value,
    orElse: () => PengaduanStatus.menunggu,
  );
}

// ---------------------------------------------------------------------------
// Model
// ---------------------------------------------------------------------------
class Pengaduan {
  final String id;
  final String? userId;
  final String name;
  final String nik;
  final DateTime date;
  final String address;
  final String description;
  final String? attachmentUrl;
  final PengaduanStatus status;
  final String? adminNote;
  final DateTime createdAt;

  const Pengaduan({
    required this.id,
    this.userId,
    required this.name,
    required this.nik,
    required this.date,
    required this.address,
    required this.description,
    this.attachmentUrl,
    required this.status,
    this.adminNote,
    required this.createdAt,
  });

  factory Pengaduan.fromMap(Map<String, dynamic> map) {
    return Pengaduan(
      id: map['id'] as String,
      userId: map['user_id'] as String?,
      name: map['name'] as String,
      nik: map['nik'] as String,
      date: DateTime.parse(map['date'] as String),
      address: map['address'] as String,
      description: map['description'] as String,
      attachmentUrl: map['attachment_url'] as String?,
      status: pengaduanStatusFromString(map['status'] as String),
      adminNote: map['admin_note'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }
}
