import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';

class MainView extends StatelessWidget {
  String name;

  // List of carousel image
  final List<String> imgList = [
    'assets/image/image1.jpg',
    'assets/image/image2.jpg',
    'assets/image/image3.jpg',
  ];

  MainView({super.key, required this.name});

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
        title: const Text('PELAYANANKU'),
        backgroundColor: const Color(0xff20B2AA),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Welcome(
                    name: name.isNotEmpty ? name.split(' ')[0] : 'Guest',
                  ),
                  const SizedBox(height: 12),
//////////////////////////////////////////////////////////////////////
////////// BUTTON INFORMASI PERSYARATAN /////////////////////////////
////////////////////////////////////////////////////////////////////
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersyaratanView(name: name),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
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
                          const SizedBox(
                            width: 250,
                            child: Text(
                              'INFORMASI PERSYARATAN',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Image.asset(
                            'assets/image/icon4.png',
                            width: 100,
                            height: 250,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

///////////////////////////////////////////////////////////////
//// BUTTON PENGADUAN MASYARAKAT ///////////////////////////////////////
//////////////////////////////////////////////////////////////
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PengaduanView(name: name),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
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
                          const SizedBox(
                            width: 250,
                            child: Text(
                              'PENGADUAN MASYARAKAT',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Image.asset(
                            'assets/image/pengaduann.png',
                            width: 100,
                            height: 250,
                          ),
                        ],
                      ),
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
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WaktuView(name: name);
                                },
                              ),
                            );
                          },
                          child: Container(
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
                      ),
//////////////////////
//////PROFIL////////////
//////////////////////
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProfilView(name: name);
                                },
                              ),
                            );
                          },
                          child: Container(
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

// ---------------------------------------------------------------------------
// Combined app logo + title + subtitle widget (replaces TitleApp + OfficeName)
// ---------------------------------------------------------------------------
class AppLogoWithTitleAndSubtitle extends StatelessWidget {
  const AppLogoWithTitleAndSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Image.asset(
            'assets/image/logo.png',
            width: 48,
            height: 48,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'PELAYANAN',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        'KU',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'KANTOR LURAH MAHARATU',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
