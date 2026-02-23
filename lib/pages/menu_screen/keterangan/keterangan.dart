import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/ahli_waris_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/domisili_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/domisili_usaha_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/kematian_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/keterangan_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/nikah_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/penghasilan_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/rekam_usaha_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/skbmr_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/skpw_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/pengaduan/pengaduan.dart';
import 'package:project_kantor_lurah/widgets/footer.dart';
import 'package:project_kantor_lurah/widgets/menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_kantor_lurah/widgets/office_name.dart';
import 'package:project_kantor_lurah/widgets/title_app.dart';
import 'package:project_kantor_lurah/widgets/welcome.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/sktm_screen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class waktu extends StatelessWidget {
  String name;
  // List of carousel image
  final List<String> imgList = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
  ];

  waktu({Key? key, required this.name}) : super(key: key);

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 20, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleApp(),
                    OfficeName(),
                  ],
                ),
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

              Container(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                        child: Text(
                      "JAM PELAYANAN",
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),

                    // Expanded(
                    //   flex: 2,
                    //   child: Center(
                    //     child: Text(
                    //       data.title!,
                    //       style: const TextStyle(
                    //         fontSize: 28,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
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
