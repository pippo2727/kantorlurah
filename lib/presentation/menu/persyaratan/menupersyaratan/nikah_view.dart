import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kantor_lurah/core.dart';

class NikahView extends StatelessWidget {
  const NikahView({super.key});

  _launchUrl() async {
    const url =
        'https://docs.google.com/document/d/1Jw_JOg1mosaKYvts0vUTwKFdya_kM3dv/edit?usp=sharing&ouid=113864027345606736968&rtpof=true&sd=true';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final PersyaratanItem data = listData[1];

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title!),
        backgroundColor: const Color(0xff20B2AA),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PERSYARATAN',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
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
                      height: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data.persyaratan!.asMap().entries.map((entry) {
                        int index = entry.key;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5.0),
                          child: Text(
                            '${index + 1}. ${entry.value}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    InkWell(
                      onTap: _launchUrl,
                      child: Container(
                        width: MediaQuery.of(context).size.height * 0.2,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.download_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              'Download Formulir\nPermohonan Nikah',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
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
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Peraturan Daerah Kota Pekanbaru \n Nomor 273 Tahun 2017',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
