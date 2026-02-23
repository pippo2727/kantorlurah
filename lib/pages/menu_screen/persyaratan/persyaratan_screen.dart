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
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/persyaratan_screen.dart';
import 'package:project_kantor_lurah/pages/menu_screen/pengaduan/pengaduan.dart';
import 'package:project_kantor_lurah/widgets/footer.dart';
import 'package:project_kantor_lurah/widgets/menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_kantor_lurah/widgets/office_name.dart';
import 'package:project_kantor_lurah/widgets/title_app.dart';
import 'package:project_kantor_lurah/widgets/welcome.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/sktm_screen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Persyaratan_screen extends StatelessWidget {
  String name;

  // List of carousel image
  final List<String> imgList = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
  ];

  Persyaratan_screen({Key? key, required this.name}) : super(key: key);

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

    // return IconButton(
    //   // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
    //   icon: FaIcon(FontAwesomeIcons.gamepad),
    //   onPressed: () { print("Pressed"); }
    //  );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      vertical: 3,
                    ),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),

                  // Welcome(
                  //   name: name.isNotEmpty ? name.split(' ')[0] : 'Guest',
                  // ),

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
                          "INFORMASI  PERSYARATAN",
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ],
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(
                  //     horizontal: 0,
                  //     vertical: 5,
                  //   ),
                  //   child: Divider(
                  //     thickness: 2,
                  //   ),
                  // ),
                  // // Carousel image
                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //     autoPlay: true,
                  //     aspectRatio: 2.0,
                  //     enlargeCenterPage: true,
                  //   ),
                  //   items: imageSliders,
                  // ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 10,
                    ),
                    child: Divider(
                      thickness: 5,
                    ),
                  ),
                  // Menu
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Menu(
                          title: 'AHLI WARIS',
                          image: 'images/icon1.png',
                          backgroundColor: Colors.teal[300],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const AhliWarisScreen();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'NIKAH',
                          image: 'images/icon2.png',
                          backgroundColor: Colors.orange[700],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const NikahScreen();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'SKTM',
                          image: 'images/icon3.png',
                          backgroundColor: Colors.yellow[700],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SktmScreen();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'KEMATIAN',
                          image: 'images/icon7.png',
                          backgroundColor: Colors.red[400],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const KematianScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    child: Divider(
                      thickness: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Menu(
                          title: 'KETERANGAN',
                          image: 'images/icon4.png',
                          backgroundColor: Colors.amber[700],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const KeteranganScreen();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'SKBMR',
                          image: 'images/icon8.png',
                          backgroundColor: Colors.purple[200],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SkbmrScreen();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'SKPW',
                          image: 'images/icon5.png',
                          backgroundColor: Colors.orange[200],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SkpwScreen();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'DOMISILI',
                          image: 'images/icon10.png',
                          backgroundColor: Colors.green[200],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DomisiliScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    child: Divider(
                      thickness: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Menu(
                          title: 'REKOM\nUSAHA',
                          image: 'images/icon9.png',
                          backgroundColor: Colors.brown[400],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const RekamUsahaScreen();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'PENGHASILAN\n',
                          image: 'images/icon6.png',
                          backgroundColor: Colors.green[400],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const PenghasilanScreen();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'DOMISILI\nUSAHA',
                          image: 'images/icon11.png',
                          backgroundColor: Colors.pink[200],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DomisiliUsahaScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    child: Divider(
                      thickness: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
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
