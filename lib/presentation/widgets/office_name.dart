import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';

class OfficeName extends StatelessWidget {
  bool isCenter;

  OfficeName({
    Key? key,
    this.isCenter = false,
  }) : super(key: key);

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
        const SizedBox(
          width: 0,
        ),
        const Text(
          'KANTOR LURAH MAHARATU',
          style: TextStyle(
            fontSize: 24,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
