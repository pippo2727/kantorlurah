import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/presentation/partials/app_logo_with_title_and_subtitle.dart';
import 'package:kantor_lurah/service/pengaduan_service.dart';
import 'package:kantor_lurah/service/supabase_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({super.key});

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
  late Future<List<Pengaduan>> _future;

  @override
  void initState() {
    super.initState();
    _future = PengaduanService.fetchAllPengaduan();
  }

  void _reload() => setState(() {
        _future = PengaduanService.fetchAllPengaduan();
      });

  Future<void> _logout(BuildContext context) async {
    await SupabaseService.logout();
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const FirstView()),
      (route) => false,
    );
  }

  List<DateTime> _currentWeekDays() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(
      7,
      (i) => DateTime(monday.year, monday.month, monday.day + i),
    );
  }

  List<_WeekdayData> _buildChartData(List<Pengaduan> all) {
    final days = _currentWeekDays();
    const labels = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    return List.generate(7, (i) {
      final d = days[i];
      final count = all.where((p) {
        final c = p.createdAt.toLocal();
        return c.year == d.year && c.month == d.month && c.day == d.day;
      }).length;
      return _WeekdayData(labels[i], count);
    });
  }

  String _formatDate(DateTime dt) {
    final l = dt.toLocal();
    return '${l.day.toString().padLeft(2, '0')}/'
        '${l.month.toString().padLeft(2, '0')}/'
        '${l.year}  '
        '${l.hour.toString().padLeft(2, '0')}:'
        '${l.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reload,
            tooltip: 'Refresh',
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Keluar',
          ),
        ],
      ),
      body: FutureBuilder<List<Pengaduan>>(
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

          final all = snapshot.data ?? [];
          final chartData = _buildChartData(all);
          final recent = all.take(5).toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLogoWithTitleAndSubtitle(),
                const SizedBox(height: 20),

                // ── Weekly chart ────────────────────────────────────────
                const Text(
                  'LAPORAN MINGGU INI',
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
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.teal.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.bar_chart_rounded,
                              color: Colors.teal,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Jumlah Laporan  Sen \u2013 Min',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        margin: EdgeInsets.zero,
                        primaryXAxis: const CategoryAxis(
                          majorGridLines: MajorGridLines(width: 0),
                          labelStyle: TextStyle(fontSize: 11),
                        ),
                        primaryYAxis: const NumericAxis(
                          minimum: 0,
                          interval: 1,
                          majorGridLines: MajorGridLines(
                            width: 0.5,
                            dashArray: [4, 4],
                            color: Color(0xFFDDDDDD),
                          ),
                          labelStyle: TextStyle(fontSize: 11),
                        ),
                        series: <CartesianSeries<_WeekdayData, String>>[
                          ColumnSeries<_WeekdayData, String>(
                            dataSource: chartData,
                            xValueMapper: (d, _) => d.day,
                            yValueMapper: (d, _) => d.count,
                            color: const Color(0xff20B2AA),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(6),
                            ),
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                              textStyle: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // ── Recent pengaduan ─────────────────────────────────────
                const Text(
                  '5 PENGADUAN TERAKHIR',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: textMutedColor,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                if (recent.isEmpty)
                  _EmptyPlaceholder()
                else
                  ...recent.map((p) => _PengaduanCard(
                        pengaduan: p,
                        formatDate: _formatDate,
                      )),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _WeekdayData {
  final String day;
  final int count;
  const _WeekdayData(this.day, this.count);
}

// ---------------------------------------------------------------------------
class _EmptyPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: 56, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Text(
            'Belum ada pengaduan',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Pengaduan yang masuk akan tampil di sini',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
class _PengaduanCard extends StatelessWidget {
  final Pengaduan pengaduan;
  final String Function(DateTime) formatDate;

  const _PengaduanCard({
    required this.pengaduan,
    required this.formatDate,
  });

  @override
  Widget build(BuildContext context) {
    final p = pengaduan;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: p.status.color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(p.status.icon, color: p.status.color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        p.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: p.status.color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        p.status.label,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: p.status.color,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  p.description,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  formatDate(p.createdAt),
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
