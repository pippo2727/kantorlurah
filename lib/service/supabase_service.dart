import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient _client = Supabase.instance.client;

  static SupabaseClient get client => _client;

  // ---------------------------------------------------------------------------
  // Auth
  // ---------------------------------------------------------------------------

  /// Register a new user with email/password + store profile in public.users
  static Future<AuthResponse> register({
    required String email,
    required String password,
    required String name,
    required DateTime birthDate,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
        'birth_date': birthDate.toIso8601String().split('T').first,
      },
    );

    // The trigger handle_new_user will insert into public.users automatically.
    // But in case the trigger didn't fire (e.g. email confirmation required),
    // we upsert manually.
    if (response.user != null) {
      await _upsertUser(
        id: response.user!.id,
        email: email,
        name: name,
        birthDate: birthDate,
      );
    }

    return response;
  }

  /// Sign in with email/password and auto-create public.users row if missing
  static Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      await _ensureUserRow(response.user!);
    }

    return response;
  }

  /// Sign out the current user
  static Future<void> logout() async {
    await _client.auth.signOut();
  }

  // ---------------------------------------------------------------------------
  // Users table helpers
  // ---------------------------------------------------------------------------

  /// Update name and birth_date for the currently logged-in user
  static Future<void> updateProfile({
    required String name,
    required DateTime birthDate,
  }) async {
    final uid = _client.auth.currentUser?.id;
    if (uid == null) throw Exception('Not logged in');
    await _client.from('users').update({
      'name': name,
      'birth_date': birthDate.toIso8601String().split('T').first,
    }).eq('id', uid);
  }

  /// Fetch the current user profile from public.users
  static Future<Map<String, dynamic>?> fetchCurrentUserProfile() async {
    final uid = _client.auth.currentUser?.id;
    if (uid == null) return null;

    final data = await _client
        .from('users')
        .select()
        .eq('id', uid)
        .maybeSingle();

    return data;
  }

  /// Upsert user row in public.users
  static Future<void> _upsertUser({
    required String id,
    required String email,
    required String name,
    required DateTime birthDate,
  }) async {
    await _client.from('users').upsert({
      'id': id,
      'email': email,
      'name': name,
      'birth_date': birthDate.toIso8601String().split('T').first,
    }, onConflict: 'id');
  }

  /// On login, ensure a row exists in public.users (creates with fallback data
  /// if the row is missing – e.g. OAuth or created before this schema).
  static Future<void> _ensureUserRow(User user) async {
    final existing = await _client
        .from('users')
        .select('id')
        .eq('id', user.id)
        .maybeSingle();

    if (existing == null) {
      final name =
          user.userMetadata?['name'] as String? ??
          user.email?.split('@').first ??
          'Unknown';
      final birthDateStr =
          user.userMetadata?['birth_date'] as String? ??
          DateTime.now().toIso8601String().split('T').first;
      await _client.from('users').insert({
        'id': user.id,
        'email': user.email ?? '',
        'name': name,
        'birth_date': birthDateStr,
      });
    }
  }
}
