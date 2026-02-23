import 'package:project_kantor_lurah/state_util.dart';
import 'package:flutter/material.dart';
import 'package:project_kantor_lurah/pages/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      title: 'Kantor Lurah Maharatu App',
navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
