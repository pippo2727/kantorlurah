import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Jenis Pelayanan enum
// ---------------------------------------------------------------------------
enum JenisPelayanan {
  skpw,
  skbmr,
  kematian,
  sktm,
  nikah,
  ahliWaris,
  domisiliUsaha,
  penghasilan,
  rekomendasiUsaha,
  domisili,
}

extension JenisPelayananX on JenisPelayanan {
  String get label {
    switch (this) {
      case JenisPelayanan.skpw:
        return 'Surat Keterangan Pindah Wilayah (SKPW)';
      case JenisPelayanan.skbmr:
        return 'Surat Keterangan Belum Memiliki Rumah (SKBMR)';
      case JenisPelayanan.kematian:
        return 'Surat Kematian';
      case JenisPelayanan.sktm:
        return 'Surat Keterangan Tidak Mampu (SKTM)';
      case JenisPelayanan.nikah:
        return 'Surat Nikah';
      case JenisPelayanan.ahliWaris:
        return 'Surat Ahli Waris';
      case JenisPelayanan.domisiliUsaha:
        return 'Surat Domisili Usaha';
      case JenisPelayanan.penghasilan:
        return 'Surat Penghasilan';
      case JenisPelayanan.rekomendasiUsaha:
        return 'Surat Rekomendasi Usaha';
      case JenisPelayanan.domisili:
        return 'Surat Domisili';
    }
  }

  String get shortLabel {
    switch (this) {
      case JenisPelayanan.skpw:
        return 'SKPW';
      case JenisPelayanan.skbmr:
        return 'SKBMR';
      case JenisPelayanan.kematian:
        return 'Kematian';
      case JenisPelayanan.sktm:
        return 'SKTM';
      case JenisPelayanan.nikah:
        return 'Nikah';
      case JenisPelayanan.ahliWaris:
        return 'Ahli Waris';
      case JenisPelayanan.domisiliUsaha:
        return 'Domisili Usaha';
      case JenisPelayanan.penghasilan:
        return 'Penghasilan';
      case JenisPelayanan.rekomendasiUsaha:
        return 'Rekom. Usaha';
      case JenisPelayanan.domisili:
        return 'Domisili';
    }
  }

  String get dbValue {
    switch (this) {
      case JenisPelayanan.skpw:
        return 'skpw';
      case JenisPelayanan.skbmr:
        return 'skbmr';
      case JenisPelayanan.kematian:
        return 'kematian';
      case JenisPelayanan.sktm:
        return 'sktm';
      case JenisPelayanan.nikah:
        return 'nikah';
      case JenisPelayanan.ahliWaris:
        return 'ahli_waris';
      case JenisPelayanan.domisiliUsaha:
        return 'domisili_usaha';
      case JenisPelayanan.penghasilan:
        return 'penghasilan';
      case JenisPelayanan.rekomendasiUsaha:
        return 'rekomendasi_usaha';
      case JenisPelayanan.domisili:
        return 'domisili';
    }
  }

  IconData get icon {
    switch (this) {
      case JenisPelayanan.skpw:
        return Icons.transfer_within_a_station;
      case JenisPelayanan.skbmr:
        return Icons.home_outlined;
      case JenisPelayanan.kematian:
        return Icons.sentiment_very_dissatisfied;
      case JenisPelayanan.sktm:
        return Icons.volunteer_activism;
      case JenisPelayanan.nikah:
        return Icons.favorite;
      case JenisPelayanan.ahliWaris:
        return Icons.family_restroom;
      case JenisPelayanan.domisiliUsaha:
        return Icons.store;
      case JenisPelayanan.penghasilan:
        return Icons.attach_money;
      case JenisPelayanan.rekomendasiUsaha:
        return Icons.recommend;
      case JenisPelayanan.domisili:
        return Icons.location_on;
    }
  }

  Color get color {
    switch (this) {
      case JenisPelayanan.skpw:
        return Colors.orange;
      case JenisPelayanan.skbmr:
        return Colors.purple;
      case JenisPelayanan.kematian:
        return Colors.red;
      case JenisPelayanan.sktm:
        return Colors.amber;
      case JenisPelayanan.nikah:
        return Colors.pink;
      case JenisPelayanan.ahliWaris:
        return Colors.teal;
      case JenisPelayanan.domisiliUsaha:
        return Colors.indigo;
      case JenisPelayanan.penghasilan:
        return Colors.green;
      case JenisPelayanan.rekomendasiUsaha:
        return Colors.brown;
      case JenisPelayanan.domisili:
        return Colors.cyan;
    }
  }

  List<String> get requiredDocuments {
    switch (this) {
      case JenisPelayanan.skpw:
        return [
          'Fotocopy Kartu Tanda Penduduk (KTP)',
          'Fotocopy Kartu Keluarga (KK)',
          'Surat Pengantar dari RT/RW',
          'Fotocopy Surat Keterangan Ganti Rugi (SKGR)',
        ];
      case JenisPelayanan.skbmr:
        return [
          'Fotocopy Kartu Keluarga (KK)',
          'Fotocopy Kartu Tanda Penduduk (KTP)',
          'Surat Pengantar dari RT/RW Bermaterai Rp.10.000',
        ];
      case JenisPelayanan.kematian:
        return [
          'Fotocopy KTP Yang Melapor',
          'Fotocopy KTP Yang Meninggal (jika ada)',
          'Fotocopy Kartu Keluarga (KK) Yang Meninggal',
          'Surat Pengantar dari RT/RW',
        ];
      case JenisPelayanan.sktm:
        return [
          'Fotocopy Kartu Keluarga (KK)',
          'Fotocopy Kartu Tanda Penduduk (KTP)',
          'Surat Pengantar dari RT/RW',
        ];
      case JenisPelayanan.nikah:
        return [
          'Fotocopy KTP Calon Pasangan',
          'Fotocopy KTP Orang Tua',
          'Fotocopy KTP 2 Orang Saksi',
          'Fotocopy KK Keluarga Pria',
          'Fotocopy KK Keluarga Perempuan',
          'Surat Izin Atasan (PNS/POLRI/TNI)',
          'Formulir Permohonan Nikah',
        ];
      case JenisPelayanan.ahliWaris:
        return [
          'Fotocopy Akta Kematian Yang Bersangkutan',
          'Fotocopy Surat Nikah Yang Meninggal',
          'Fotocopy KK Seluruh Ahli Waris',
          'Fotocopy KTP Seluruh Ahli Waris',
          'Fotocopy Akta Kelahiran Seluruh Ahli Waris',
          'Fotocopy Surat Nikah Ahli Waris (jika sudah menikah)',
          'Fotocopy KTP 2 Orang Saksi',
          'Materai Rp.10.000',
        ];
      case JenisPelayanan.domisiliUsaha:
        return [
          'Fotocopy Kartu Tanda Penduduk (KTP)',
          'Fotocopy Kartu Keluarga (KK)',
          'Fotocopy Pajak Bumi dan Bangunan (PBB)',
          'Surat Pengantar dari RT/RW',
        ];
      case JenisPelayanan.penghasilan:
        return [
          'Fotocopy Kartu Tanda Penduduk (KTP)',
          'Fotocopy Kartu Keluarga (KK)',
          'Surat Pengantar dari RT/RW',
          'Surat Pernyataan Bermaterai Rp.10.000',
        ];
      case JenisPelayanan.rekomendasiUsaha:
        return [
          'Fotocopy Kartu Tanda Penduduk (KTP)',
          'Fotocopy Kartu Keluarga (KK)',
          'Surat Pengantar dari RT/RW',
          'Fotocopy Akta Notaris Pendirian Usaha',
          'Fotocopy Pajak Bumi dan Bangunan (PBB)',
        ];
      case JenisPelayanan.domisili:
        return [
          'Fotocopy Kartu Tanda Penduduk (KTP)',
          'Fotocopy Kartu Keluarga (KK)',
          'Surat Pengantar dari RT/RW',
        ];
    }
  }
}

JenisPelayanan jenisPelayananFromString(String value) {
  switch (value) {
    case 'skpw':
      return JenisPelayanan.skpw;
    case 'skbmr':
      return JenisPelayanan.skbmr;
    case 'kematian':
      return JenisPelayanan.kematian;
    case 'sktm':
      return JenisPelayanan.sktm;
    case 'nikah':
      return JenisPelayanan.nikah;
    case 'ahli_waris':
      return JenisPelayanan.ahliWaris;
    case 'domisili_usaha':
      return JenisPelayanan.domisiliUsaha;
    case 'penghasilan':
      return JenisPelayanan.penghasilan;
    case 'rekomendasi_usaha':
      return JenisPelayanan.rekomendasiUsaha;
    case 'domisili':
      return JenisPelayanan.domisili;
    default:
      return JenisPelayanan.domisili;
  }
}

// ---------------------------------------------------------------------------
// Status enum
// ---------------------------------------------------------------------------
enum PelayananStatus { menunggu, diproses, selesai, ditolak }

extension PelayananStatusX on PelayananStatus {
  String get label {
    switch (this) {
      case PelayananStatus.menunggu:
        return 'Menunggu';
      case PelayananStatus.diproses:
        return 'Diproses';
      case PelayananStatus.selesai:
        return 'Selesai';
      case PelayananStatus.ditolak:
        return 'Ditolak';
    }
  }

  Color get color {
    switch (this) {
      case PelayananStatus.menunggu:
        return Colors.orange;
      case PelayananStatus.diproses:
        return Colors.blue;
      case PelayananStatus.selesai:
        return Colors.green;
      case PelayananStatus.ditolak:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case PelayananStatus.menunggu:
        return Icons.hourglass_empty;
      case PelayananStatus.diproses:
        return Icons.sync;
      case PelayananStatus.selesai:
        return Icons.check_circle;
      case PelayananStatus.ditolak:
        return Icons.cancel;
    }
  }
}

PelayananStatus pelayananStatusFromString(String value) {
  return PelayananStatus.values.firstWhere(
    (e) => e.name == value,
    orElse: () => PelayananStatus.menunggu,
  );
}

// ---------------------------------------------------------------------------
// Document model for uploaded files
// ---------------------------------------------------------------------------
class PelayananDocument {
  final String label;
  final String url;

  const PelayananDocument({
    required this.label,
    required this.url,
  });

  factory PelayananDocument.fromMap(Map<String, dynamic> map) {
    return PelayananDocument(
      label: map['label'] as String,
      url: map['url'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'url': url,
    };
  }
}

// ---------------------------------------------------------------------------
// Pelayanan Model
// ---------------------------------------------------------------------------
class Pelayanan {
  final String id;
  final String? userId;
  final JenisPelayanan jenisPelayanan;
  final String name;
  final String nik;
  final String? phone;
  final String? address;
  final List<PelayananDocument> documents;
  final PelayananStatus status;
  final String? adminNote;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Pelayanan({
    required this.id,
    this.userId,
    required this.jenisPelayanan,
    required this.name,
    required this.nik,
    this.phone,
    this.address,
    required this.documents,
    required this.status,
    this.adminNote,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pelayanan.fromMap(Map<String, dynamic> map) {
    final docsJson = map['documents'] as List<dynamic>? ?? [];
    final docs = docsJson
        .map((e) => PelayananDocument.fromMap(e as Map<String, dynamic>))
        .toList();

    return Pelayanan(
      id: map['id'] as String,
      userId: map['user_id'] as String?,
      jenisPelayanan: jenisPelayananFromString(map['jenis_pelayanan'] as String),
      name: map['name'] as String,
      nik: map['nik'] as String,
      phone: map['phone'] as String?,
      address: map['address'] as String?,
      documents: docs,
      status: pelayananStatusFromString(map['status'] as String),
      adminNote: map['admin_note'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }
}
