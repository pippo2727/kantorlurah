import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  bool isCenter;

  TitleApp({
    super.key,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: const [
        Text(
          'PELAYANAN',
          style: TextStyle(
            fontSize: 24,
            color: Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'KU',
          style: TextStyle(
            fontSize: 24,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
