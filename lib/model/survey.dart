class SurveyResponse {
  final String id;
  final String? userId;
  final String? userName;
  final String? userEmail;
  final Map<int, int> answers;
  final DateTime createdAt;

  const SurveyResponse({
    required this.id,
    this.userId,
    this.userName,
    this.userEmail,
    required this.answers,
    required this.createdAt,
  });

  factory SurveyResponse.fromMap(Map<String, dynamic> map) {
    final rawAnswers = map['answers'] as Map<String, dynamic>;
    final answers = rawAnswers.map(
      (k, v) => MapEntry(int.parse(k), (v as num).toInt()),
    );

    final user = map['users'] as Map<String, dynamic>?;

    return SurveyResponse(
      id: map['id'] as String,
      userId: map['user_id'] as String?,
      userName: user?['name'] as String?,
      userEmail: user?['email'] as String?,
      answers: answers,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  double get averageScore {
    if (answers.isEmpty) return 0;
    final total = answers.values.reduce((a, b) => a + b);
    return total / answers.length;
  }
}

class SurveyQuestion {
  final int number;
  final String text;

  const SurveyQuestion({required this.number, required this.text});
}

const List<SurveyQuestion> surveyQuestions = [
  SurveyQuestion(number: 1, text: 'Aplikasi PelayananKU mudah digunakan'),
  SurveyQuestion(number: 2, text: 'Tampilan aplikasi mudah dipahami'),
  SurveyQuestion(number: 3, text: 'Menu pada aplikasi tersusun dengan jelas'),
  SurveyQuestion(
    number: 4,
    text: 'Informasi persyaratan layanan mudah dipahami',
  ),
  SurveyQuestion(
    number: 5,
    text: 'Fitur pengajuan pelayanan mudah digunakan',
  ),
  SurveyQuestion(
    number: 6,
    text: 'Fitur pengaduan masyarakat berjalan dengan baik',
  ),
  SurveyQuestion(number: 7, text: 'Informasi jam pelayanan mudah diakses'),
  SurveyQuestion(
    number: 8,
    text: 'Informasi profil kantor lurah tersedia dengan jelas',
  ),
  SurveyQuestion(
    number: 9,
    text: 'Proses login aplikasi berjalan dengan baik',
  ),
  SurveyQuestion(
    number: 10,
    text: 'Aplikasi membantu mempermudah proses pelayanan masyarakat',
  ),
  SurveyQuestion(
    number: 11,
    text: 'Aplikasi mempercepat penyampaian informasi pelayanan',
  ),
  SurveyQuestion(
    number: 12,
    text: 'Aplikasi membantu menyampaikan pengaduan masyarakat dengan mudah',
  ),
  SurveyQuestion(
    number: 13,
    text: 'Status permohonan pelayanan mudah dipantau',
  ),
  SurveyQuestion(
    number: 14,
    text: 'Aplikasi berjalan dengan stabil saat digunakan',
  ),
  SurveyQuestion(
    number: 15,
    text:
        'Secara keseluruhan aplikasi PelayananKU bermanfaat bagi masyarakat',
  ),
];

const Map<int, String> surveyOptionLabels = {
  5: 'Sangat Setuju',
  4: 'Setuju',
  3: 'Cukup',
  2: 'Tidak Setuju',
  1: 'Sangat Tidak Setuju',
};
