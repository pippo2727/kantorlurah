import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';

class SurveyView extends StatefulWidget {
  const SurveyView({super.key});

  @override
  State<SurveyView> createState() => _SurveyViewState();
}

class _SurveyViewState extends State<SurveyView> {
  final Map<int, int> _answers = {};
  bool _loading = true;
  bool _submitting = false;
  bool _alreadySubmitted = false;
  SurveyResponse? _existingResponse;

  @override
  void initState() {
    super.initState();
    _checkExisting();
  }

  Future<void> _checkExisting() async {
    try {
      final existing = await SurveyService.fetchMySurvey();
      if (existing != null) {
        setState(() {
          _alreadySubmitted = true;
          _existingResponse = existing;
          _loading = false;
        });
      } else {
        setState(() => _loading = false);
      }
    } catch (e) {
      setState(() => _loading = false);
    }
  }

  Future<void> _submit() async {
    if (_answers.length < surveyQuestions.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Mohon jawab semua pertanyaan terlebih dahulu'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _submitting = true);
    try {
      await SurveyService.submitSurvey(_answers);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Survey berhasil dikirim. Terima kasih!'),
          backgroundColor: Colors.green,
        ),
      );
      setState(() {
        _alreadySubmitted = true;
        _submitting = false;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal mengirim survey: $e'),
          backgroundColor: Colors.red,
        ),
      );
      setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SURVEY KEPUASAN',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xFFF4F6F8),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _alreadySubmitted
          ? _buildAlreadySubmitted()
          : _buildSurveyForm(),
    );
  }

  Widget _buildAlreadySubmitted() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 64,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Terima Kasih!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textPrimaryColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Anda sudah mengisi survey kepuasan.\nTerima kasih atas partisipasi Anda.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: textSecondaryColor),
            ),
            if (_existingResponse != null) ...[
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Rata-rata skor Anda',
                      style: TextStyle(fontSize: 13, color: textMutedColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _existingResponse!.averageScore.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const Text(
                      'dari 5.0',
                      style: TextStyle(fontSize: 12, color: textHintColor),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSurveyForm() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: primaryColor.withValues(alpha: 0.08),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Survey Kepuasan Pengguna',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textPrimaryColor,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Berikan penilaian Anda terhadap aplikasi PelayananKU',
                style: TextStyle(fontSize: 13, color: textSecondaryColor),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: surveyQuestions.length + 1,
            itemBuilder: (context, index) {
              if (index == surveyQuestions.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _submitting ? null : _submit,
                      child: _submitting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Kirim Survey',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                );
              }

              final q = surveyQuestions[index];
              return _QuestionCard(
                question: q,
                selectedValue: _answers[q.number],
                onChanged: (value) {
                  setState(() => _answers[q.number] = value);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final SurveyQuestion question;
  final int? selectedValue;
  final ValueChanged<int> onChanged;

  const _QuestionCard({
    required this.question,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: selectedValue != null
            ? Border.all(color: primaryColor.withValues(alpha: 0.3), width: 1)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selectedValue != null
                      ? primaryColor
                      : Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${question.number}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: selectedValue != null
                        ? Colors.white
                        : Colors.black54,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  question.text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [5, 4, 3, 2, 1].map((score) {
              final isSelected = selectedValue == score;
              return GestureDetector(
                onTap: () => onChanged(score),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _scoreColor(score)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? _scoreColor(score)
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    '$score - ${surveyOptionLabels[score]}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: isSelected ? Colors.white : textSecondaryColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Color _scoreColor(int score) {
    switch (score) {
      case 5:
        return const Color(0xFF2E7D32);
      case 4:
        return const Color(0xFF43A047);
      case 3:
        return Colors.orange;
      case 2:
        return const Color(0xFFE65100);
      case 1:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
