import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';

class MainPage extends StatelessWidget {
  String name;

  // List of carousel image
  final List<String> imgList = [
    'assets/image/image1.jpg',
    'assets/image/image2.jpg',
    'assets/image/image3.jpg',
  ];

  MainPage({Key? key, required this.name}) : super(key: key);

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 20, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                  Welcome(
                    name: name.isNotEmpty ? name.split(' ')[0] : 'Guest',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 5,
                    ),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
//////////////////////////////////////////////////////////////////////
////////// BUTTON INFORMASI PERSYARATAN /////////////////////////////
////////////////////////////////////////////////////////////////////
                  Container(
                    width: 380,
                    height: 140,
                    padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.teal,
                          Color.fromARGB(31, 109, 226, 0),
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
                            // const Text(
                            //   "Persyaratan",
                            //   style: TextStyle(
                            //       color: Colors.black87,
                            //       fontSize: 20,
                            //       fontWeight: FontWeight.bold),
                            // ),

                            // const SizedBox(
                            //   height: 4,
                            //   ),
                            const SizedBox(
                                width: 250,
                                child: Text(
                                  "INFORMASI PERSYARATAN ",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              height: 10,
                            ),

                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Persyaratan_screen(name: name);
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                width: 250,
                                height: 35,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 187, 206, 204),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Klik Untuk Melihat",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/image/icon4.png',
                          width: 100,
                          height: 250,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

// ///////////////////////////////////////////////////////////
// // ////////////////////////////////////////////////////////
// // ///// BUTTON PENGADUAN ///////////////////////////////
// ///////////////////////////////////////////////////////
//                   Container(
//                     width: 380,
//                     height: 140,
//                     padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [
//                           Colors.blueGrey,
//                           Colors.purple,
//                         ],
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                       ),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           children: [
//                             const Text(
//                               "PENGADUAN MASYARAKAT",
//                               style: TextStyle(
//                                   color: Colors.black87,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             const SizedBox(
//                                 width: 120,
//                                 child: Text(
//                                   "Berita Terkini",
//                                   style: TextStyle(
//                                       color: Colors.black87,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold),
//                                 )),
//                             const SizedBox(
//                               height: 35,
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) {
//                                       return const berita_terkini();
//                                     },
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 width: 150,
//                                 height: 35,
//                                 padding: const EdgeInsets.all(8.0),
//                                 decoration: BoxDecoration(
//                                   color: Colors.blueAccent,
//                                   borderRadius: BorderRadius.circular(12.0),
//                                 ),
//                                 child: const Center(
//                                   child: Text(
//                                     "Klik Untuk Melihat",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Image.asset(
//                           'assets/image/reporter.jpg',
//                           width: 150,
//                           height: 100,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),

///////////////////////////////////////////////////////////////
//// BUTTON PENGADUAN MASYARAKAT ///////////////////////////////////////
//////////////////////////////////////////////////////////////
                  Container(
                    width: 380,
                    height: 140,
                    padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.teal,
                          Color.fromARGB(31, 109, 226, 0),
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
                                width: 250,
                                child: Text(
                                  "PENGADUAN MASYARAKAT ",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return pengaduan(name: name);
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                width: 250,
                                height: 35,
                                padding: const EdgeInsets.all(.0),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 187, 206, 204),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Klik Untuk Melihat",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/image/pengaduann.png',
                          width: 100,
                          height: 250,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

////////////////////////////////////////////////////////////////////
//////////////BUTTON KETERRANGAN //////////////////////////////////
//////////////////////////////////////////////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return waktu(name: name);
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: 180,
                          height: 120,
                          padding: const EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.teal,
                                Color.fromARGB(31, 109, 226, 0),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/image/jam.png',
                                height: 74,
                                width: 500,
                              ),
                              const SizedBox(
                                  height: 30,
                                  width: 115,
                                  child: Text(
                                    "JAM PELAYANAN",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
//////////////////////
//////PROFIL////////////
//////////////////////
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return profil(name: name);
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: 180,
                          height: 120,
                          padding: const EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(31, 109, 226, 0),
                                Colors.teal,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/image/profil.png',
                                height: 74,
                                width: 500,
                              ),
                              const SizedBox(
                                  height: 30,
                                  width: 48,
                                  child: Text(
                                    "PROFIL",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 10,
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
