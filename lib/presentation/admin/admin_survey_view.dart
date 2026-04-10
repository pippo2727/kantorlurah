import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminSurveyView extends StatefulWidget {
  const AdminSurveyView({super.key});

  @override
  State<AdminSurveyView> createState() => _AdminSurveyViewState();
}

class _AdminSurveyViewState extends State<AdminSurveyView> {
  late Future<List<SurveyResponse>> _future;

  @override
  void initState() {
    super.initState();
    _future = SurveyService.fetchAllSurveys();
  }

  void _reload() => setState(() {
        _future = SurveyService.fetchAllSurveys();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HASIL SURVEY'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reload,
            tooltip: 'Refresh',
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF4F6F8),
      body: FutureBuilder<List<SurveyResponse>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    'Gagal memuat data:\n${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _reload,
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            );
          }

          final responses = snapshot.data ?? [];

          if (responses.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.poll_outlined,
                      size: 64, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  Text(
                    'Belum ada responden',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Hasil survey akan tampil setelah pengguna mengisi',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                  ),
                ],
              ),
            );
          }

          return _buildResults(responses);
        },
      ),
    );
  }

  Widget _buildResults(List<SurveyResponse> responses) {
    final questionAverages = _calculateAverages(responses);
    final overallAvg = questionAverages.values.isEmpty
        ? 0.0
        : questionAverages.values.reduce((a, b) => a + b) /
            questionAverages.values.length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary cards
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            AdminRespondentListView(responses: responses),
                      ),
                    );
                  },
                  child: _SummaryCard(
                    icon: Icons.people_outline,
                    label: 'Total Responden',
                    value: '${responses.length}',
                    color: Colors.blue,
                    showArrow: true,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SummaryCard(
                  icon: Icons.star_outline,
                  label: 'Rata-rata Skor',
                  value: overallAvg.toStringAsFixed(2),
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Chart
          const Text(
            'RATA-RATA SKOR PER PERTANYAAN',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: textMutedColor,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Container(
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
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              margin: const EdgeInsets.only(right: 8),
              primaryXAxis: CategoryAxis(
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: const TextStyle(fontSize: 11),
                labelRotation: 0,
                title: const AxisTitle(
                  text: 'Pertanyaan',
                  textStyle: TextStyle(fontSize: 11, color: textMutedColor),
                ),
              ),
              primaryYAxis: const NumericAxis(
                minimum: 0,
                maximum: 5,
                interval: 1,
                majorGridLines: MajorGridLines(
                  width: 0.5,
                  dashArray: [4, 4],
                  color: Color(0xFFDDDDDD),
                ),
                labelStyle: TextStyle(fontSize: 11),
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_ChartData, String>>[
                BarSeries<_ChartData, String>(
                  dataSource: questionAverages.entries
                      .map((e) => _ChartData('P${e.key}', e.value))
                      .toList(),
                  xValueMapper: (d, _) => d.label,
                  yValueMapper: (d, _) => d.value,
                  color: primaryColor,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(6),
                  ),
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(fontSize: 10),
                    labelAlignment: ChartDataLabelAlignment.outer,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Detail per question
          const Text(
            'DETAIL PER PERTANYAAN',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: textMutedColor,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          ...surveyQuestions.map((q) {
            final avg = questionAverages[q.number] ?? 0.0;
            return _QuestionResultCard(question: q, average: avg);
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Map<int, double> _calculateAverages(List<SurveyResponse> responses) {
    final Map<int, List<int>> scores = {};

    for (final r in responses) {
      for (final entry in r.answers.entries) {
        scores.putIfAbsent(entry.key, () => []).add(entry.value);
      }
    }

    return scores.map((k, v) => MapEntry(k, v.reduce((a, b) => a + b) / v.length));
  }
}

// ---------------------------------------------------------------------------
class _ChartData {
  final String label;
  final double value;
  const _ChartData(this.label, this.value);
}

// ---------------------------------------------------------------------------
class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final bool showArrow;

  const _SummaryCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    this.showArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: textMutedColor),
          ),
          if (showArrow) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Lihat Detail',
                  style: TextStyle(
                    fontSize: 11,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 2),
                Icon(Icons.arrow_forward_ios, size: 10, color: color),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _QuestionResultCard extends StatelessWidget {
  final SurveyQuestion question;
  final double average;

  const _QuestionResultCard({
    required this.question,
    required this.average,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (average / 5.0).clamp(0.0, 1.0);

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _scoreColor(average).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${question.number}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: _scoreColor(average),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  question.text,
                  style: const TextStyle(fontSize: 13, color: textPrimaryColor),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                average.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: _scoreColor(average),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage,
              minHeight: 6,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation(_scoreColor(average)),
            ),
          ),
        ],
      ),
    );
  }

  Color _scoreColor(double avg) {
    if (avg >= 4.0) return const Color(0xFF2E7D32);
    if (avg >= 3.0) return Colors.orange;
    if (avg >= 2.0) return const Color(0xFFE65100);
    return Colors.red;
  }
}
