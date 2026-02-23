import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';


class PersyaratanView extends StatelessWidget {
  String name;

  // List of carousel image
  final List<String> imgList = [
    'assets/image/image1.jpg',
    'assets/image/image2.jpg',
    'assets/image/image3.jpg',
  ];

  PersyaratanView({super.key, required this.name});

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
                          style: TextStyle(
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
                          image: 'assets/image/icon1.png',
                          backgroundColor: Colors.teal[300],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const AhliWarisView();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'NIKAH',
                          image: 'assets/image/icon2.png',
                          backgroundColor: Colors.orange[700],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const NikahView();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'SKTM',
                          image: 'assets/image/icon3.png',
                          backgroundColor: Colors.yellow[700],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SktmView();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'KEMATIAN',
                          image: 'assets/image/icon7.png',
                          backgroundColor: Colors.red[400],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const KematianView();
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
                          image: 'assets/image/icon4.png',
                          backgroundColor: Colors.amber[700],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const KeteranganPersyaratanView();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'SKBMR',
                          image: 'assets/image/icon8.png',
                          backgroundColor: Colors.purple[200],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SkbmrView();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'SKPW',
                          image: 'assets/image/icon5.png',
                          backgroundColor: Colors.orange[200],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SkpwView();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'DOMISILI',
                          image: 'assets/image/icon10.png',
                          backgroundColor: Colors.green[200],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DomisiliView();
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
                          image: 'assets/image/icon9.png',
                          backgroundColor: Colors.brown[400],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const RekamUsahaView();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'PENGHASILAN\n',
                          image: 'assets/image/icon6.png',
                          backgroundColor: Colors.green[400],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const PenghasilanView();
                                },
                              ),
                            );
                          },
                        ),
                        Menu(
                          title: 'DOMISILI\nUSAHA',
                          image: 'assets/image/icon11.png',
                          backgroundColor: Colors.pink[200],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DomisiliUsahaView();
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
