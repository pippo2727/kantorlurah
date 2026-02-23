import 'package:flutter/material.dart';
import 'package:kantor_lurah/model/pengaduan.dart';
import 'package:kantor_lurah/service/pengaduan_service.dart';

// ---------------------------------------------------------------------------
// AdminPengaduanView — admin sees all pengaduan
// ---------------------------------------------------------------------------
class AdminPengaduanView extends StatefulWidget {
  const AdminPengaduanView({super.key});

  @override
  State<AdminPengaduanView> createState() => _AdminPengaduanViewState();
}

class _AdminPengaduanViewState extends State<AdminPengaduanView> {
  late Future<List<Pengaduan>> _future;
  String _searchQuery = '';
  PengaduanStatus? _filterStatus;

  @override
  void initState() {
    super.initState();
    _future = PengaduanService.fetchAllPengaduan();
  }

  void _reload() {
    setState(() {
      _future = PengaduanService.fetchAllPengaduan();
    });
  }

  List<Pengaduan> _applyFilters(List<Pengaduan> all) {
    return all.where((p) {
      final matchStatus =
          _filterStatus == null || p.status == _filterStatus;
      final q = _searchQuery.toLowerCase();
      final matchSearch = q.isEmpty ||
          p.name.toLowerCase().contains(q) ||
          p.nik.contains(q) ||
          p.description.toLowerCase().contains(q) ||
          p.address.toLowerCase().contains(q);
      return matchStatus && matchSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaduan Masuk'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _reload),
        ],
      ),
      body: Column(
        children: [
          // ── Search bar ────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: TextField(
              onChanged: (v) => setState(() => _searchQuery = v),
              decoration: InputDecoration(
                hintText: 'Cari nama, NIK, keterangan...',
                prefixIcon: const Icon(Icons.search, color: Colors.teal),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () =>
                            setState(() => _searchQuery = ''),
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        color: Colors.teal, width: 1.5)),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
          ),
          // ── Status filter chips ───────────────────────────────────────
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
                            _filterStatus =
                                _filterStatus == s ? null : s),
                      ),
                    )),
              ],
            ),
          ),
          // ── List ──────────────────────────────────────────────────────
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
                              ? 'Belum ada pengaduan masuk'
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
                      return _AdminPengaduanCard(
                        pengaduan: item,
                        onTap: () async {
                          final updated = await Navigator.push<bool>(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  AdminPengaduanDetailView(
                                      pengaduan: item),
                            ),
                          );
                          if (updated == true) _reload();
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
              Icon(icon,
                  size: 13,
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
// Admin list card
// ---------------------------------------------------------------------------
class _AdminPengaduanCard extends StatelessWidget {
  final Pengaduan pengaduan;
  final VoidCallback onTap;

  const _AdminPengaduanCard({required this.pengaduan, required this.onTap});

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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pengaduan.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'NIK: ${pengaduan.nik}',
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  _StatusBadge(status: status),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_today,
                      size: 13, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(pengaduan.date),
                    style:
                        const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.location_on,
                      size: 13, color: Colors.grey),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      pengaduan.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
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
// Status badge (shared)
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
// AdminPengaduanDetailView — admin can update status & add note
// ---------------------------------------------------------------------------
class AdminPengaduanDetailView extends StatefulWidget {
  final Pengaduan pengaduan;

  const AdminPengaduanDetailView({super.key, required this.pengaduan});

  @override
  State<AdminPengaduanDetailView> createState() =>
      _AdminPengaduanDetailViewState();
}

class _AdminPengaduanDetailViewState
    extends State<AdminPengaduanDetailView> {
  late PengaduanStatus _selectedStatus;
  late TextEditingController _noteController;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.pengaduan.status;
    _noteController =
        TextEditingController(text: widget.pengaduan.adminNote ?? '');
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      await PengaduanService.updateStatus(
        widget.pengaduan.id,
        _selectedStatus,
        adminNote: _noteController.text.trim().isEmpty
            ? null
            : _noteController.text.trim(),
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Status berhasil diperbarui'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context, true); // signal that list should reload
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyimpan: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.pengaduan;
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
            // ----------------------------------------------------------------
            // Info section
            // ----------------------------------------------------------------
            _sectionTitle('Informasi Pelapor'),
            _DetailRow(label: 'Nama', value: p.name),
            _DetailRow(label: 'NIK', value: p.nik),
            _DetailRow(
              label: 'Tanggal',
              value:
                  '${p.date.day.toString().padLeft(2, '0')}/${p.date.month.toString().padLeft(2, '0')}/${p.date.year}',
            ),
            _DetailRow(label: 'Alamat', value: p.address),
            _DetailRow(label: 'Keterangan', value: p.description),
            if (p.attachmentUrl != null) ...[
              const SizedBox(height: 8),
              _sectionTitle('Lampiran'),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  p.attachmentUrl!,
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
            const SizedBox(height: 20),
            const Divider(thickness: 2),
            const SizedBox(height: 12),
            // ----------------------------------------------------------------
            // Admin action section
            // ----------------------------------------------------------------
            _sectionTitle('Update Status'),
            const SizedBox(height: 12),
            // Status dropdown
            DropdownButtonFormField<PengaduanStatus>(
              initialValue: _selectedStatus,
              decoration: InputDecoration(
                labelText: 'Status Pengaduan',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 14),
              ),
              items: PengaduanStatus.values.map((s) {
                return DropdownMenuItem(
                  value: s,
                  child: Row(
                    children: [
                      Icon(s.icon, color: s.color, size: 18),
                      const SizedBox(width: 8),
                      Text(s.label),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _selectedStatus = val);
              },
            ),
            const SizedBox(height: 16),
            // Admin note
            TextFormField(
              controller: _noteController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Catatan Admin (opsional)',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 24),
            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saving ? null : _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: _saving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2),
                      )
                    : const Text('Simpan Perubahan',
                        style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.teal),
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
