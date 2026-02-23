import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/service/supabase_service.dart';

class EditProfileView extends StatefulWidget {
  final String initialName;
  final DateTime? initialBirthDate;

  const EditProfileView({
    super.key,
    required this.initialName,
    this.initialBirthDate,
  });

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  DateTime? _birthDate;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _birthDate = widget.initialBirthDate;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Pilih Tanggal Lahir',
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: primaryColor),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _birthDate = picked);
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_birthDate == null) {
      AppSnackbar.error('Tanggal lahir wajib diisi');
      return;
    }

    setState(() => _isLoading = true);
    try {
      await SupabaseService.updateProfile(
        name: _nameController.text.trim(),
        birthDate: _birthDate!,
      );
      if (!mounted) return;
      AppSnackbar.success('Profil berhasil diperbarui');
      Navigator.of(context).pop(true); // pop with true = refresh signal
    } catch (e) {
      if (!mounted) return;
      AppSnackbar.error('Gagal memperbarui profil. Silakan coba lagi.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        title: const Text(
          'Edit Profil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // ── Name field ──────────────────────────────────────────────
              const Text(
                'Nama',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Masukkan nama lengkap',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: primaryColor, width: 1.5),
                  ),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Nama wajib diisi';
                  if (v.trim().length < 2) return 'Nama terlalu pendek';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // ── Birth date field ─────────────────────────────────────────
              const Text(
                'Tanggal Lahir',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined,
                          size: 18, color: primaryColor),
                      const SizedBox(width: 10),
                      Text(
                        _birthDate != null
                            ? DateFormat('dd MMMM yyyy', 'id').format(_birthDate!)
                            : 'Pilih tanggal lahir',
                        style: TextStyle(
                          fontSize: 15,
                          color: _birthDate != null
                              ? Colors.black87
                              : Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // ── Save button ──────────────────────────────────────────────
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white),
                        )
                      : const Text(
                          'Simpan Perubahan',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
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
