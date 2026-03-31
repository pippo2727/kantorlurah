import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kantor_lurah/model/pelayanan.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide MultipartFile;

const _cloudName = 'ddsznmckt';
const _uploadPreset = 'upload';
const _cloudinaryUrl = 'https://api.cloudinary.com/v1_1/$_cloudName/raw/upload';

class PelayananService {
  static final SupabaseClient _client = Supabase.instance.client;

  // -------------------------------------------------------------------------
  // Upload PDF document → Cloudinary, returns secure_url
  // -------------------------------------------------------------------------
  static Future<String> uploadDocument(PlatformFile file) async {
    final dio = Dio();
    
    final bytes = file.bytes;
    if (bytes == null) {
      throw Exception('File bytes is null');
    }

    final formData = FormData.fromMap({
      'upload_preset': _uploadPreset,
      'file': MultipartFile.fromBytes(
        bytes,
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
  // Submit pelayanan permohonan
  // -------------------------------------------------------------------------
  static Future<void> submitPelayanan({
    required JenisPelayanan jenisPelayanan,
    required String name,
    required String nik,
    String? phone,
    String? address,
    required List<PelayananDocument> documents,
  }) async {
    final uid = _client.auth.currentUser?.id;

    await _client.from('pelayanan').insert({
      'user_id': uid,
      'jenis_pelayanan': jenisPelayanan.dbValue,
      'name': name,
      'nik': nik,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      'documents': documents.map((d) => d.toMap()).toList(),
    });
  }

  // -------------------------------------------------------------------------
  // User: fetch their own pelayanan
  // -------------------------------------------------------------------------
  static Future<List<Pelayanan>> fetchMyPelayanan() async {
    final uid = _client.auth.currentUser?.id;
    if (uid == null) return [];

    final data = await _client
        .from('pelayanan')
        .select()
        .eq('user_id', uid)
        .order('created_at', ascending: false);

    return (data as List).map((e) => Pelayanan.fromMap(e)).toList();
  }

  // -------------------------------------------------------------------------
  // Admin: fetch all pelayanan
  // -------------------------------------------------------------------------
  static Future<List<Pelayanan>> fetchAllPelayanan() async {
    final data = await _client
        .from('pelayanan')
        .select()
        .order('created_at', ascending: false);

    return (data as List).map((e) => Pelayanan.fromMap(e)).toList();
  }

  // -------------------------------------------------------------------------
  // Admin: update status (and optional note)
  // -------------------------------------------------------------------------
  static Future<void> updateStatus(
    String id,
    PelayananStatus status, {
    String? adminNote,
  }) async {
    await _client.from('pelayanan').update({
      'status': status.name,
      if (adminNote != null) 'admin_note': adminNote,
    }).eq('id', id);
  }
}
