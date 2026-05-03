import 'dart:async';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthErrorMessage {
  static String login(Object error) {
    if (error is AuthException) {
      return _authMessage(error, action: _AuthAction.login);
    }

    return _generalMessage(error, fallback: 'Login gagal. Silakan coba lagi.');
  }

  static String register(Object error) {
    if (error is AuthException) {
      return _authMessage(error, action: _AuthAction.register);
    }

    return _generalMessage(
      error,
      fallback: 'Pendaftaran gagal. Silakan coba lagi.',
    );
  }

  static String _authMessage(
    AuthException error, {
    required _AuthAction action,
  }) {
    final message = error.message.trim();
    final lower = message.toLowerCase();
    final statusCode = error.statusCode;

    if (_hasAny(lower, ['invalid login credentials', 'invalid credentials'])) {
      return 'Email atau password salah. Periksa kembali data login Anda.';
    }

    if (_hasAny(lower, ['email not confirmed', 'email_not_confirmed'])) {
      return 'Email belum dikonfirmasi. Cek inbox atau spam untuk link konfirmasi.';
    }

    if (_hasAny(lower, [
      'user already registered',
      'already registered',
      'already exists',
    ])) {
      return 'Email ini sudah terdaftar. Silakan masuk atau gunakan email lain.';
    }

    if (_hasAny(lower, [
      'password should be at least',
      'weak password',
      'password is too weak',
    ])) {
      return 'Password terlalu lemah. Gunakan minimal 6 karakter dan kombinasi yang lebih kuat.';
    }

    if (_hasAny(lower, ['signup is disabled', 'signups not allowed'])) {
      return 'Pendaftaran sedang dinonaktifkan di Supabase.';
    }

    if (_hasAny(lower, ['email rate limit exceeded', 'rate limit'])) {
      return 'Terlalu banyak percobaan. Tunggu beberapa menit lalu coba lagi.';
    }

    if (_hasAny(lower, ['invalid email'])) {
      return 'Format email tidak valid.';
    }

    if (_hasAny(lower, ['network', 'failed host lookup', 'socketexception'])) {
      return 'Tidak bisa terhubung ke Supabase. Periksa koneksi internet Anda.';
    }

    if (statusCode == '400') {
      return action == _AuthAction.login
          ? 'Login ditolak oleh Supabase: $message'
          : 'Pendaftaran ditolak oleh Supabase: $message';
    }

    if (statusCode == '401') {
      return 'Akses ditolak oleh Supabase. Periksa konfigurasi URL dan anon key aplikasi.';
    }

    if (statusCode == '429') {
      return 'Terlalu banyak percobaan. Tunggu beberapa menit lalu coba lagi.';
    }

    return action == _AuthAction.login
        ? 'Login gagal: $message'
        : 'Pendaftaran gagal: $message';
  }

  static String _generalMessage(Object error, {required String fallback}) {
    if (error is PostgrestException) {
      final detail = error.details?.toString();
      final hint = error.hint;
      final parts = [
        error.message,
        if (detail != null && detail.isNotEmpty) detail,
        if (hint != null && hint.isNotEmpty) hint,
      ];
      return 'Database error: ${parts.join(' ')}';
    }

    if (error is SocketException || error is TimeoutException) {
      return 'Tidak bisa terhubung ke server. Periksa koneksi internet Anda.';
    }

    final message = error.toString().trim();
    if (message.isEmpty) return fallback;

    return '$fallback Detail: $message';
  }

  static bool _hasAny(String message, List<String> keywords) {
    return keywords.any(message.contains);
  }
}

enum _AuthAction { login, register }
