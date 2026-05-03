import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kantor_lurah/model/pelayanan.dart';
import 'package:kantor_lurah/service/pelayanan_service.dart';

class PelayananFormView extends StatefulWidget {
  final JenisPelayanan jenisPelayanan;

  const PelayananFormView({super.key, required this.jenisPelayanan});

  @override
  State<PelayananFormView> createState() => _PelayananFormViewState();
}

class _PelayananFormViewState extends State<PelayananFormView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nikController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  late List<PlatformFile?> _selectedFiles;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _selectedFiles = List.filled(
      widget.jenisPelayanan.requiredDocuments.length,
      null,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nikController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _pickFile(int index) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFiles[index] = result.files.first;
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    // Check all files uploaded
    for (int i = 0; i < _selectedFiles.length; i++) {
      if (_selectedFiles[i] == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Mohon upload dokumen: ${widget.jenisPelayanan.requiredDocuments[i]}',
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    setState(() => _isSubmitting = true);

    try {
      // Upload all documents
      final List<PelayananDocument> documents = [];
      for (int i = 0; i < _selectedFiles.length; i++) {
        final file = _selectedFiles[i]!;
        final url = await PelayananService.uploadDocument(file);
        documents.add(
          PelayananDocument(
            label: widget.jenisPelayanan.requiredDocuments[i],
            url: url,
          ),
        );
      }

      // Submit pelayanan
      await PelayananService.submitPelayanan(
        jenisPelayanan: widget.jenisPelayanan,
        name: _nameController.text.trim(),
        nik: _nikController.text.trim(),
        phone: _phoneController.text.trim().isNotEmpty
            ? _phoneController.text.trim()
            : null,
        address: _addressController.text.trim().isNotEmpty
            ? _addressController.text.trim()
            : null,
        documents: documents,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Permohonan berhasil diajukan!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal mengajukan permohonan: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final requiredDocs = widget.jenisPelayanan.requiredDocuments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.jenisPelayanan.shortLabel,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: widget.jenisPelayanan.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: widget.jenisPelayanan.color.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            widget.jenisPelayanan.icon,
                            color: widget.jenisPelayanan.color,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.jenisPelayanan.label,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: widget.jenisPelayanan.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Lengkapi data diri dan upload dokumen persyaratan dalam format PDF.',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Data Diri
                const Text(
                  'Data Diri',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap *',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Wajib diisi' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nikController,
                  decoration: const InputDecoration(
                    labelText: 'NIK *',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.credit_card),
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Wajib diisi';
                    if (v.trim().length != 16) return 'NIK harus 16 digit';
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'No. Telepon',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 24),

                // Dokumen Persyaratan
                const Text(
                  'Dokumen Persyaratan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Upload dokumen dalam format PDF',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),

                ...List.generate(requiredDocs.length, (index) {
                  final file = _selectedFiles[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: file != null ? Colors.green : Colors.grey[300]!,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: file != null
                          ? Colors.green.withOpacity(0.05)
                          : Colors.grey[50],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: file != null
                                    ? Colors.green
                                    : Colors.grey[400],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: file != null
                                    ? const Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                    : Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                requiredDocs[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        if (file != null)
                          Row(
                            children: [
                              const Icon(
                                Icons.picture_as_pdf,
                                size: 18,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  file.name,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TextButton(
                                onPressed: () => _pickFile(index),
                                child: const Text('Ganti'),
                              ),
                            ],
                          )
                        else
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () => _pickFile(index),
                              icon: const Icon(Icons.upload_file),
                              label: const Text('Upload PDF'),
                            ),
                          ),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 24),

                // Peraturan
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Peraturan Daerah Kota Pekanbaru\nNomor 273 Tahun 2017',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),

                const SizedBox(height: 24),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Ajukan Permohonan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
