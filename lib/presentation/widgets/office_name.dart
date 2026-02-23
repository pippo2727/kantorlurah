import 'package:flutter/material.dart';

class OfficeName extends StatelessWidget {
  bool isCenter;

  OfficeName({
    super.key,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Image.asset(
          'assets/image/logo.png',
          width: 42,
          height: 50,
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Text(
            'KANTOR LURAH MAHARATU',
            style: TextStyle(
              fontSize: 24,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
