import 'package:kantor_lurah/model/survey.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SurveyService {
  static final SupabaseClient _client = Supabase.instance.client;

  // ---------------------------------------------------------------------------
  // User: submit survey
  // ---------------------------------------------------------------------------
  static Future<void> submitSurvey(Map<int, int> answers) async {
    final uid = _client.auth.currentUser?.id;
    if (uid == null) throw Exception('Not logged in');

    final jsonAnswers = answers.map((k, v) => MapEntry(k.toString(), v));

    await _client.from('survey_responses').insert({
      'user_id': uid,
      'answers': jsonAnswers,
    });
  }

  // ---------------------------------------------------------------------------
  // User: check if already submitted
  // ---------------------------------------------------------------------------
  static Future<bool> hasSubmitted() async {
    final uid = _client.auth.currentUser?.id;
    if (uid == null) return false;

    final data = await _client
        .from('survey_responses')
        .select('id')
        .eq('user_id', uid)
        .maybeSingle();

    return data != null;
  }

  // ---------------------------------------------------------------------------
  // User: fetch own survey response
  // ---------------------------------------------------------------------------
  static Future<SurveyResponse?> fetchMySurvey() async {
    final uid = _client.auth.currentUser?.id;
    if (uid == null) return null;

    final data = await _client
        .from('survey_responses')
        .select()
        .eq('user_id', uid)
        .maybeSingle();

    if (data == null) return null;
    return SurveyResponse.fromMap(data);
  }

  // ---------------------------------------------------------------------------
  // Admin: fetch all survey responses
  // ---------------------------------------------------------------------------
  static Future<List<SurveyResponse>> fetchAllSurveys() async {
    final data = await _client
        .from('survey_responses')
        .select('*, users(name, email)')
        .order('created_at', ascending: false);

    return (data as List).map((e) => SurveyResponse.fromMap(e)).toList();
  }
}
