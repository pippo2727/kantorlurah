import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  final bool isCenter;

  const TitleApp({
    super.key,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
      height: 1.1,
    );

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: isCenter ? Alignment.center : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('PELAYANAN', style: textStyle.copyWith(color: Colors.teal)),
          Text('KU', style: textStyle.copyWith(color: Colors.orange)),
        ],
      ),
    );
  }
}

