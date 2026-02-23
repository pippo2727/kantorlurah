import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';

class ProfilView extends StatelessWidget {
  String name;
  // List of carousel image
  final List<String> imgList = [
    'assets/image/image1.jpg',
    'assets/image/image2.jpg',
    'assets/image/image3.jpg',
  ];

  ProfilView({super.key, required this.name});

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
        title: const Text('PROFIL'),
        backgroundColor: const Color(0xff20B2AA),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 5,
                ),
                child: Divider(
                  thickness: 2,
                ),
              ),
              // Carousel image
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
              const SizedBox(
                height: 26,
              ),

              Container(
                width: 375,
                height: 340,
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
                            'Kantor Lurah Maharatu merupakan perangkat pemerintahan kelurahan yang berada di bawah Kecamatan Marpoyan Damai, Kota Pekanbaru. Kantor lurah berperan sebagai ujung tombak pelayanan pemerintahan kepada masyarakat di tingkat kelurahan, dengan tugas utama menyelenggarakan pelayanan administrasi, pemerintahan, pembangunan, serta pemberdayaan masyarakat.',
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
              Container(
                width: 375,
                height: 190,
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
                            "IDENTITAS KANTOR LURAH ",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '⚫ Nama Kelurahan : Maharatu',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '⚫ Kecamatan : Marpoyan Damai',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '⚫ Kota : Pekanbaru',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '⚫ Provinsi : Riau',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '⚫ Status Wilayah : Kelurahan',
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
              Container(
                width: 375,
                height: 550,
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
                            "VISI",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            'Terwujudnya pelayanan publik yang prima, transparan, dan akuntabel guna meningkatkan kesejahteraan masyarakat Kelurahan Maharatu.',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            "MISI",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '1. Meningkatkan kualitas pelayanan administrasi kelurahan yang cepat, tepat, dan ramah.',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '2. Mewujudkan tata kelola pemerintahan kelurahan yang transparan dan bertanggung jawab.',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '3. Mendorong partisipasi aktif masyarakat dalam pembangunan dan kegiatan sosial.',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 350,
                          child: Text(
                            '4. Memanfaatkan teknologi informasi dalam mendukung pelayanan kepada masyarakat.',
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
