import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';

class KeteranganView extends StatelessWidget {
  String name;
  // List of carousel image
  final List<String> imgList = [
    'assets/image/image1.jpg',
    'assets/image/image2.jpg',
    'assets/image/image3.jpg',
  ];

  KeteranganView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(0.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('KETERANGAN'),
        backgroundColor: const Color(0xff20B2AA),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 10,
              ),
////////////////////////////////////////////////////////////////////////
////////////////kolom jam layanan kantor/////////////////////////
////////////////////////////////////////////////////////
              Container(
                width: 375,
                height: 220,
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.teal,
                      Colors.teal,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          width: 350,
                          child: Text(
                            "JAM LAYANAN KANTOR ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '🕘 Senin – Kamis',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '      08.00 WIB – 15.30 WIB',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '🕘 Jumat',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '      08.00 WIB – 11.30 WIB',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '🕘 Sabtu & Minggu',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '      Tutup',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
/////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
              /////////////////KOLOM CATATATN LAYANAN/////////////////
              Container(
                width: 375,
                height: 200,
                padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.teal,
                      Colors.teal,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          width: 350,
                          child: Text(
                            "CATATAN LAYANAN",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '📌 Istirahat:',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '      Senin – Kamis : 12.00 - 13.00 WIB ',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '      Jumat : 11.30 – 13.15 WIB',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '📌 Layanan tertentu dapat tutup lebih',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '      awal pada hari libur nasional.',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 16,
              ),
              Footer(
                email: 'kelurahanmaharatu@gmail.com',
                instagram: ' kelurahanmaharatu',
                phoneNumber:
                    '+62 813-6566-4033 - Irvan Habibi\n +62 852-7221-3468 - Sigit Tri Haryanto',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
