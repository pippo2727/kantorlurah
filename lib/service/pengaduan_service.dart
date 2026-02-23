import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kantor_lurah/model/pengaduan.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide MultipartFile;

const _cloudName = 'ddsznmckt';
const _uploadPreset = 'upload';
const _cloudinaryUrl =
    'https://api.cloudinary.com/v1_1/$_cloudName/image/upload';

class PengaduanService {
  static final SupabaseClient _client = Supabase.instance.client;

  // -------------------------------------------------------------------------
  // Upload attachment → Cloudinary, returns secure_url
  // -------------------------------------------------------------------------
  static Future<String> uploadAttachment(XFile file) async {
    final dio = Dio();
    final formData = FormData.fromMap({
      'upload_preset': _uploadPreset,
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.name,
      ),
    });

    final response = await dio.post(_cloudinaryUrl, data: formData);
    if (response.statusCode == 200) {
      return response.data['secure_url'] as String;
    }
    throw Exception('Cloudinary upload failed: ${response.statusCode}');
  }

  // -------------------------------------------------------------------------
  // Submit pengaduan
  // -------------------------------------------------------------------------
  static Future<void> submitPengaduan({
    required String name,
    required String nik,
    required DateTime date,
    required String address,
    required String description,
    String? attachmentUrl,
  }) async {
    final uid = _client.auth.currentUser?.id;

    await _client.from('pengaduan').insert({
      'user_id': uid,
      'name': name,
      'nik': nik,
      'date': date.toIso8601String().split('T').first,
      'address': address,
      'description': description,
      if (attachmentUrl != null) 'attachment_url': attachmentUrl,
    });
  }

  // -------------------------------------------------------------------------
  // User: fetch their own pengaduan
  // -------------------------------------------------------------------------
  static Future<List<Pengaduan>> fetchMyPengaduan() async {
    final uid = _client.auth.currentUser?.id;
    if (uid == null) return [];

    final data = await _client
        .from('pengaduan')
        .select()
        .eq('user_id', uid)
        .order('created_at', ascending: false);

    return (data as List).map((e) => Pengaduan.fromMap(e)).toList();
  }

  // -------------------------------------------------------------------------
  // Admin: fetch all pengaduan
  // -------------------------------------------------------------------------
  static Future<List<Pengaduan>> fetchAllPengaduan() async {
    final data = await _client
        .from('pengaduan')
        .select()
        .order('created_at', ascending: false);

    return (data as List).map((e) => Pengaduan.fromMap(e)).toList();
  }

  // -------------------------------------------------------------------------
  // Admin: update status (and optional note)
  // -------------------------------------------------------------------------
  static Future<void> updateStatus(
    String id,
    PengaduanStatus status, {
    String? adminNote,
  }) async {
    await _client.from('pengaduan').update({
      'status': status.name,
      if (adminNote != null) 'admin_note': adminNote,
    }).eq('id', id);
  }

}
