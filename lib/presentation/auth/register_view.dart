import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/service/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  DateTime? _birthDate;
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  Future<void> _register() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_birthDate == null) {
      AppSnackbar.error('Tanggal lahir wajib diisi');
      return;
    }
    _formKey.currentState!.save();

    setState(() => _isLoading = true);
    try {
      final response = await SupabaseService.register(
        email: _email,
        password: _password,
        name: _name,
        birthDate: _birthDate!,
      );

      if (!mounted) return;

      if (response.user != null) {
        AppSnackbar.success('Pendaftaran berhasil! Silakan masuk.');
        Navigator.of(context).pop(); // back to FirstView / LoginView
      } else {
        // Email confirmation required
        AppSnackbar.success(
            'Cek email Anda untuk konfirmasi, lalu silakan masuk.');
        Navigator.of(context).pop();
      }
    } on AuthException catch (e) {
      if (!mounted) return;
      AppSnackbar.error(e.message);
    } catch (e) {
      if (!mounted) return;
      AppSnackbar.error('Terjadi kesalahan. Silakan coba lagi.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Akun'),
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleApp(isCenter: true),
              OfficeName(isCenter: true),
              const SizedBox(height: 24),
              const Text(
                'BUAT AKUN BARU',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Lengkapi data diri Anda untuk mendaftar',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Full Name
              QTextField(
                label: 'Nama Lengkap',
                hint: 'Masukkan nama lengkap Anda',
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Nama wajib diisi';
                  if (v.trim().length < 2) return 'Nama terlalu pendek';
                  return null;
                },
                onChanged: (v) => _name = v.trim(),
              ),
              const SizedBox(height: 12),

              // Birth Date
              QDateField(
                label: 'Tanggal Lahir',
                hint: 'Pilih tanggal lahir',
                value: _birthDate,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                clearable: true,
                onChanged: (d) => setState(() => _birthDate = d),
              ),
              const SizedBox(height: 12),

              // Email
              QTextField(
                label: 'Email',
                hint: 'contoh@email.com',
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Email wajib diisi';
                  if (!v.contains('@')) return 'Format email tidak valid';
                  return null;
                },
                onChanged: (v) => _email = v.trim(),
              ),
              const SizedBox(height: 12),

              // Password
              QTextField(
                label: 'Password',
                hint: 'Minimal 6 karakter',
                obscureText: true,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Password wajib diisi';
                  if (v.length < 6) return 'Password minimal 6 karakter';
                  return null;
                },
                onChanged: (v) => _password = v,
              ),
              const SizedBox(height: 12),

              // Confirm Password
              QTextField(
                label: 'Konfirmasi Password',
                hint: 'Ulangi password Anda',
                obscureText: true,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Konfirmasi password wajib diisi';
                  }
                  if (v != _password) return 'Password tidak cocok';
                  return null;
                },
              ),
              const SizedBox(height: 28),

              QButton(
                label: 'Daftar',
                isLoading: _isLoading,
                onPressed: _register,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sudah punya akun? ',
                      style: TextStyle(color: Colors.black54)),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
