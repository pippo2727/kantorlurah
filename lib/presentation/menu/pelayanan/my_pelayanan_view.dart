import 'package:flutter/material.dart';
import 'package:kantor_lurah/model/pelayanan.dart';
import 'package:kantor_lurah/service/pelayanan_service.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPelayananView extends StatefulWidget {
  const MyPelayananView({super.key});

  @override
  State<MyPelayananView> createState() => _MyPelayananViewState();
}

class _MyPelayananViewState extends State<MyPelayananView> {
  late Future<List<Pelayanan>> _future;

  @override
  void initState() {
    super.initState();
    _future = PelayananService.fetchMyPelayanan();
  }

  void _reload() {
    setState(() {
      _future = PelayananService.fetchMyPelayanan();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat Permohonan',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _reload),
        ],
      ),
      body: FutureBuilder<List<Pelayanan>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _reload,
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            );
          }

          final list = snapshot.data ?? [];

          if (list.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.inbox_outlined, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'Belum ada permohonan',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => _reload(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final p = list[index];
                return _PelayananCard(
                  pelayanan: p,
                  onTap: () => _showDetail(context, p),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showDetail(BuildContext context, Pelayanan p) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: p.jenisPelayanan.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      p.jenisPelayanan.icon,
                      color: p.jenisPelayanan.color,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.jenisPelayanan.label,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: p.status.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                p.status.icon,
                                size: 14,
                                color: p.status.color,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                p.status.label,
                                style: TextStyle(
                                  color: p.status.color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 32),
              _DetailRow(label: 'Nama', value: p.name),
              _DetailRow(label: 'NIK', value: p.nik),
              if (p.phone != null)
                _DetailRow(label: 'Telepon', value: p.phone!),
              if (p.address != null)
                _DetailRow(label: 'Alamat', value: p.address!),
              _DetailRow(
                label: 'Tanggal Pengajuan',
                value:
                    '${p.createdAt.day}/${p.createdAt.month}/${p.createdAt.year}',
              ),
              if (p.adminNote != null && p.adminNote!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber.withOpacity(0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.note, size: 16, color: Colors.amber),
                          SizedBox(width: 4),
                          Text(
                            'Catatan Admin',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(p.adminNote!),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 16),
              const Text(
                'Dokumen Yang Diupload',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...p.documents.map(
                (doc) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                  title: Text(doc.label, style: const TextStyle(fontSize: 14)),
                  trailing: IconButton(
                    icon: const Icon(Icons.open_in_new),
                    onPressed: () async {
                      final uri = Uri.parse(doc.url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PelayananCard extends StatelessWidget {
  final Pelayanan pelayanan;
  final VoidCallback onTap;

  const _PelayananCard({required this.pelayanan, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: pelayanan.jenisPelayanan.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  pelayanan.jenisPelayanan.icon,
                  color: pelayanan.jenisPelayanan.color,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pelayanan.jenisPelayanan.shortLabel,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${pelayanan.createdAt.day}/${pelayanan.createdAt.month}/${pelayanan.createdAt.year}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: pelayanan.status.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      pelayanan.status.icon,
                      size: 14,
                      color: pelayanan.status.color,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      pelayanan.status.label,
                      style: TextStyle(
                        color: pelayanan.status.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: TextStyle(color: Colors.grey[600])),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
