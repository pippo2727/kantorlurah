import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kantor_lurah/core.dart';
import 'package:kantor_lurah/l10n/app_localizations.dart';
import 'package:kantor_lurah/core/theme/theme.dart';
import 'package:kantor_lurah/core/util/contextless/navigation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: SplashScreen(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
