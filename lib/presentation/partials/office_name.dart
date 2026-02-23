import 'package:flutter/material.dart';

class OfficeName extends StatelessWidget {
  final bool isCenter;

  const OfficeName({
    super.key,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: isCenter ? Alignment.center : Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/image/logo.png',
            width: 42,
            height: 50,
          ),
          const SizedBox(width: 8),
          const Text(
            'KANTOR LURAH MAHARATU',
            style: TextStyle(
              fontSize: 24,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
