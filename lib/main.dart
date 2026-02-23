import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kantor_lurah/core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://nyrgcbrhnytfyddaibju.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im55cmdjYnJobnl0ZnlkZGFpYmp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE4NDY3ODksImV4cCI6MjA4NzQyMjc4OX0.fu3eOE3i_EsihcaN02e9bMgDXyEKX18zaRHjXAECTPE',
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantor Lurah Maharatu App',
      navigatorKey: Nav.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: SplashView(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
