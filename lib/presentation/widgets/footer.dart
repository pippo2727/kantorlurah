import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kantor_lurah/core.dart';

class Footer extends StatelessWidget {
  String? email;
  String? instagram;
  String? phoneNumber;

  Footer({
    Key? key,
    this.email,
    this.phoneNumber,
    this.instagram,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              child: Divider(
                thickness: 2,
              ),
            ),
            const Text(
              'CONTACT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  email!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  instagram!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  phoneNumber!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              child: Divider(
                thickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
