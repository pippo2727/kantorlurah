import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/service/pengaduan_service.dart';

class InputPengaduanView extends StatefulWidget {
  final String name;

  const InputPengaduanView({super.key, required this.name});

  @override
  State<InputPengaduanView> createState() => _InputPengaduanViewState();
}

class _InputPengaduanViewState extends State<InputPengaduanView> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  String _nik = '';
  DateTime _date = DateTime.now();
  String _address = '';
  String _description = '';
  XFile? _attachmentFile;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    if (kDebugMode) {
      _nik = '3201012501900001';
      _address = 'Jl. Merdeka No. 10, RT 002/RW 003, Kel. Sukamaju, Kec. Cimahi Tengah';
      _description = 'Jalan di depan gang RT 002 mengalami kerusakan parah akibat hujan deras selama seminggu terakhir. Lubang-lubang besar membahayakan pengendara motor dan pejalan kaki.';
    }
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    _formKey.currentState!.save();

    setState(() => _isLoading = true);
    try {
      String? attachmentUrl;
      if (_attachmentFile != null) {
        attachmentUrl =
            await PengaduanService.uploadAttachment(_attachmentFile!);
      }

      await PengaduanService.submitPengaduan(
        name: _name,
        nik: _nik,
        date: _date,
        address: _address,
        description: _description,
        attachmentUrl: attachmentUrl,
      );

      if (!mounted) return;
      AppSnackbar.success('Pengaduan berhasil dikirim!');
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      AppSnackbar.error('Gagal mengirim pengaduan: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text('Buat Pengaduan',
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionHeader(title: 'DATA PELAPOR'),
              const SizedBox(height: 12),

              QTextField(
                label: 'Nama Lengkap',
                hint: 'Nama pelapor',
                initialValue: _name,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Nama wajib diisi'
                    : null,
                onChanged: (v) => _name = v.trim(),
              ),
              const SizedBox(height: 12),

              QTextField(
                label: 'NIK',
                hint: 'Nomor Induk Kependudukan (16 digit)',
                initialValue: _nik,
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'NIK wajib diisi';
                  if (v.trim().length != 16) return 'NIK harus 16 digit';
                  return null;
                },
                onChanged: (v) => _nik = v.trim(),
              ),
              const SizedBox(height: 12),

              QDateField(
                label: 'Tanggal Kejadian',
                value: _date,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                clearable: false,
                onChanged: (d) {
                  if (d != null) setState(() => _date = d);
                },
              ),
              const SizedBox(height: 12),

              QTextArea(
                label: 'Alamat',
                hint: 'Alamat lengkap pelapor',
                initialValue: _address,
                minLines: 2,
                maxLines: 4,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Alamat wajib diisi'
                    : null,
                onChanged: (v) => _address = v.trim(),
              ),
              const SizedBox(height: 20),

              _SectionHeader(title: 'ISI PENGADUAN'),
              const SizedBox(height: 12),

              QTextArea(
                label: 'Uraian Pengaduan',
                hint:
                    'Jelaskan secara lengkap kejadian yang ingin dilaporkan',
                initialValue: _description,
                minLines: 4,
                maxLines: 8,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Uraian pengaduan wajib diisi';
                  }
                  if (v.trim().length < 20) {
                    return 'Uraian terlalu singkat (min. 20 karakter)';
                  }
                  return null;
                },
                onChanged: (v) => _description = v.trim(),
              ),
              const SizedBox(height: 20),

              _SectionHeader(title: 'LAMPIRAN (OPSIONAL)'),
              const SizedBox(height: 12),

              FileUploadField(
                label: 'Foto / Bukti Pendukung',
                onChanged: (f) => setState(() => _attachmentFile = f),
              ),
              const SizedBox(height: 28),

              QButton(
                label: 'Kirim Pengaduan',
                isLoading: _isLoading,
                onPressed: _submit,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 16,
          color: Colors.teal,
          margin: const EdgeInsets.only(right: 8),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
