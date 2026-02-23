import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/model/pengaduan.dart';
import 'package:kantor_lurah/service/pengaduan_service.dart';

// ---------------------------------------------------------------------------
// MyPengaduanView — user sees their own list
// ---------------------------------------------------------------------------
class MyPengaduanView extends StatefulWidget {
  const MyPengaduanView({super.key});

  @override
  State<MyPengaduanView> createState() => _MyPengaduanViewState();
}

class _MyPengaduanViewState extends State<MyPengaduanView> {
  late Future<List<Pengaduan>> _future;
  String _searchQuery = '';
  PengaduanStatus? _filterStatus; // null = show all

  @override
  void initState() {
    super.initState();
    _future = PengaduanService.fetchMyPengaduan();
  }

  void _reload() {
    setState(() {
      _future = PengaduanService.fetchMyPengaduan();
    });
  }

  List<Pengaduan> _applyFilters(List<Pengaduan> all) {
    return all.where((p) {
      final matchStatus =
          _filterStatus == null || p.status == _filterStatus;
      final q = _searchQuery.toLowerCase();
      final matchSearch = q.isEmpty ||
          p.name.toLowerCase().contains(q) ||
          p.description.toLowerCase().contains(q) ||
          p.address.toLowerCase().contains(q);
      return matchStatus && matchSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaduan Saya'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reload,
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Search bar ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: TextField(
              onChanged: (v) => setState(() => _searchQuery = v),
              decoration: InputDecoration(
                hintText: 'Cari pengaduan...',
                prefixIcon: const Icon(Icons.search, color: Colors.teal),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => setState(() => _searchQuery = ''),
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.teal, width: 1.5)),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
          ),
          // ── Status filter chips ─────────────────────────────────────────
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            child: Row(
              children: [
                _FilterChip(
                  label: 'Semua',
                  selected: _filterStatus == null,
                  color: Colors.teal,
                  onTap: () => setState(() => _filterStatus = null),
                ),
                const SizedBox(width: 8),
                ...PengaduanStatus.values.map((s) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _FilterChip(
                        label: s.label,
                        selected: _filterStatus == s,
                        color: s.color,
                        icon: s.icon,
                        onTap: () => setState(() =>
                            _filterStatus = _filterStatus == s ? null : s),
                      ),
                    )),
              ],
            ),
          ),
          // ── List ────────────────────────────────────────────────────────
          Expanded(
            child: FutureBuilder<List<Pengaduan>>(
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
                        const Icon(Icons.error_outline,
                            color: Colors.red, size: 48),
                        const SizedBox(height: 12),
                        Text('Gagal memuat data: ${snapshot.error}',
                            textAlign: TextAlign.center),
                        const SizedBox(height: 12),
                        ElevatedButton(
                            onPressed: _reload,
                            child: const Text('Coba Lagi')),
                      ],
                    ),
                  );
                }
                final filtered = _applyFilters(snapshot.data ?? []);
                if (filtered.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.inbox_outlined,
                            size: 64, color: Colors.grey),
                        const SizedBox(height: 12),
                        Text(
                          (snapshot.data ?? []).isEmpty
                              ? 'Belum ada pengaduan'
                              : 'Tidak ada hasil yang cocok',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async => _reload(),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, i) {
                      final item = filtered[i];
                      return _PengaduanCard(
                        pengaduan: item,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  PengaduanDetailView(pengaduan: item),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Filter chip
// ---------------------------------------------------------------------------
class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final IconData? icon;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.color,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? color : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: selected ? color : Colors.grey.shade300, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 13,
                  color: selected ? Colors.white : Colors.grey.shade600),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: selected ? Colors.white : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared card widget
// ---------------------------------------------------------------------------
class _PengaduanCard extends StatelessWidget {
  final Pengaduan pengaduan;
  final VoidCallback onTap;

  const _PengaduanCard({required this.pengaduan, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final status = pengaduan.status;
    return Card(
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  Expanded(
                    child: Text(
                      pengaduan.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  _StatusBadge(status: status),
                ],
              ),
              const SizedBox(height: 6),
              // Date
              Row(
                children: [
                  const Icon(Icons.calendar_today,
                      size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(pengaduan.date),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              // Description preview
              Text(
                pengaduan.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';
}

// ---------------------------------------------------------------------------
// Status badge
// ---------------------------------------------------------------------------
class _StatusBadge extends StatelessWidget {
  final PengaduanStatus status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: status.color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(status.icon, size: 12, color: status.color),
          const SizedBox(width: 4),
          Text(
            status.label,
            style: TextStyle(
              color: status.color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// PengaduanDetailView — read-only for user
// ---------------------------------------------------------------------------
class PengaduanDetailView extends StatelessWidget {
  final Pengaduan pengaduan;

  const PengaduanDetailView({super.key, required this.pengaduan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengaduan'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: pengaduan.status.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: pengaduan.status.color),
              ),
              child: Row(
                children: [
                  Icon(pengaduan.status.icon, color: pengaduan.status.color),
                  const SizedBox(width: 8),
                  Text(
                    'Status: ${pengaduan.status.label}',
                    style: TextStyle(
                      color: pengaduan.status.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            if (pengaduan.adminNote != null && pengaduan.adminNote!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Catatan Admin:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(pengaduan.adminNote!),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),
            _DetailRow(label: 'Nama', value: pengaduan.name),
            _DetailRow(label: 'NIK', value: pengaduan.nik),
            _DetailRow(
              label: 'Tanggal',
              value:
                  '${pengaduan.date.day.toString().padLeft(2, '0')}/${pengaduan.date.month.toString().padLeft(2, '0')}/${pengaduan.date.year}',
            ),
            _DetailRow(label: 'Alamat', value: pengaduan.address),
            _DetailRow(label: 'Keterangan', value: pengaduan.description),
            if (pengaduan.attachmentUrl != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Lampiran:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        pengaduan.attachmentUrl!,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Row(
                          children: [
                            Icon(Icons.broken_image, color: Colors.grey),
                            SizedBox(width: 8),
                            Text('Tidak dapat menampilkan lampiran'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Detail row helper
// ---------------------------------------------------------------------------
class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(fontSize: 14)),
          const Divider(),
        ],
      ),
    );
  }
}
