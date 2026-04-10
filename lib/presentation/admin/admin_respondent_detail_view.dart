import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';

class AdminRespondentDetailView extends StatelessWidget {
  final SurveyResponse response;

  const AdminRespondentDetailView({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    final name = response.userName ?? 'Anonim';
    final email = response.userEmail ?? '-';
    final avg = response.averageScore;
    final date = _formatDate(response.createdAt);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DETAIL RESPONDEN'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF4F6F8),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      name.isNotEmpty ? name[0].toUpperCase() : '?',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: textPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          email,
                          style: const TextStyle(
                            fontSize: 13,
                            color: textSecondaryColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Diisi pada $date',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        avg.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: _scoreColor(avg),
                        ),
                      ),
                      Text(
                        'dari 5.0',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Answers header
            const Text(
              'JAWABAN SURVEY',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: textMutedColor,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),

            // Answer cards
            ...surveyQuestions.map((q) {
              final score = response.answers[q.number];
              return _AnswerCard(question: q, score: score);
            }),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    final l = dt.toLocal();
    return '${l.day.toString().padLeft(2, '0')}/'
        '${l.month.toString().padLeft(2, '0')}/'
        '${l.year}  '
        '${l.hour.toString().padLeft(2, '0')}:'
        '${l.minute.toString().padLeft(2, '0')}';
  }

  Color _scoreColor(double avg) {
    if (avg >= 4.0) return const Color(0xFF2E7D32);
    if (avg >= 3.0) return Colors.orange;
    if (avg >= 2.0) return const Color(0xFFE65100);
    return Colors.red;
  }
}

class _AnswerCard extends StatelessWidget {
  final SurveyQuestion question;
  final int? score;

  const _AnswerCard({required this.question, required this.score});

  @override
  Widget build(BuildContext context) {
    final s = score ?? 0;
    final label = surveyOptionLabels[s] ?? 'Tidak dijawab';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _scoreColor(s).withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Text(
              '${question.number}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: _scoreColor(s),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.text,
                  style:
                      const TextStyle(fontSize: 13, color: textPrimaryColor),
                ),
                const SizedBox(height: 6),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _scoreColor(s).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$s - $label',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _scoreColor(s),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _scoreColor(int score) {
    if (score >= 4) return const Color(0xFF2E7D32);
    if (score >= 3) return Colors.orange;
    if (score >= 2) return const Color(0xFFE65100);
    return Colors.red;
  }
}
