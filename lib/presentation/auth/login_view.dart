import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/service/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  Future<void> _login() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    _formKey.currentState!.save();

    setState(() => _isLoading = true);
    try {
      final response = await SupabaseService.login(
        email: _email,
        password: _password,
      );

      if (!mounted) return;

      final user = response.user;
      if (user != null) {
        final profile = await SupabaseService.fetchCurrentUserProfile();
        final name = profile?['name'] as String? ?? user.email ?? 'User';

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => MainView(name: name)),
          (route) => false,
        );
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/image/image2.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.38,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleApp(isCenter: true),
                    OfficeName(isCenter: true),
                    const SizedBox(height: 24),
                    const Text(
                      'MASUK',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Silakan masuk dengan akun Anda',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    const SizedBox(height: 20),
                    QTextField(
                      label: 'Email',
                      hint: 'contoh@email.com',
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Email wajib diisi';
                        if (!v.contains('@')) return 'Format email tidak valid';
                        return null;
                      },
                      onChanged: (v) => _email = v,
                    ),
                    const SizedBox(height: 12),
                    QTextField(
                      label: 'Password',
                      hint: '••••••••',
                      obscureText: true,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Password wajib diisi';
                        return null;
                      },
                      onChanged: (v) => _password = v,
                    ),
                    const SizedBox(height: 24),
                    QButton(
                      label: 'Masuk',
                      isLoading: _isLoading,
                      onPressed: _login,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Belum punya akun? ',
                            style: TextStyle(color: Colors.black54)),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const RegisterView()),
                          ),
                          child: Text(
                            'Daftar',
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
          ],
        ),
      ),
    );
  }
}
