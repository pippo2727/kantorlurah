import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/presentation/partials/app_logo_with_title_and_subtitle.dart';
import 'package:kantor_lurah/service/supabase_service.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  bool _isLoading = false;

  Future<void> _quickLogin({
    required String email,
    required String password,
  }) async {
    setState(() => _isLoading = true);
    try {
      final response =
          await SupabaseService.login(email: email, password: password);
      if (!mounted) return;
      final user = response.user;
      if (user == null) return;
      const adminEmail = 'admin@demo.com';
      if ((user.email ?? '').toLowerCase() == adminEmail) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const AdminMainNavigationView()),
          (route) => false,
        );
      } else {
        final profile = await SupabaseService.fetchCurrentUserProfile();
        if (!mounted) return;
        final name = profile?['name'] as String? ?? user.email ?? 'User';
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) =>
                UserMainNavigationView(name: name, email: user.email ?? ''),
          ),
          (route) => false,
        );
      }
    } catch (e) {
      if (!mounted) return;
      AppSnackbar.error('Quick login gagal: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  'assets/image/image2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.63,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(66),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 12),
                        child: AppLogoWithTitleAndSubtitle(),
                      ),
                      Greeting(),
                      const SizedBox(height: 20),
                      QButton(
                        label: 'Masuk',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginView()),
                        ),
                      ),
                      const SizedBox(height: 10),
                      QButton(
                        label: 'Daftar',
                        type: QButtonType.secondary,
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterView()),
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (kDebugMode) ...[  
                        const Divider(height: 24),
                        const Center(
                          child: Text(
                            '🛠 Debug Quick Login',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: _isLoading
                                  ? null
                                  : () => _quickLogin(
                                        email: 'kantorlurah@mailinator.com',
                                        password: '!KantorLurah123',
                                      ),
                              child: const Text(
                                'Login User',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            const Text('·',
                                style: TextStyle(color: Colors.grey)),
                            TextButton(
                              onPressed: _isLoading
                                  ? null
                                  : () => _quickLogin(
                                        email: 'admin@demo.com',
                                        password: 'Admin@123',
                                      ),
                              child: const Text(
                                'Login Admin',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.orange),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

