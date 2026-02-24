import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';

class SkbmrView extends StatelessWidget {
  const SkbmrView({super.key});

  @override
  Widget build(BuildContext context) {
    final PersyaratanItem data = listData[7];

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
                            style: const TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
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
                          children: const [
                            Expanded(
                              child: Text(
                                'Peraturan Daerah Kota Pekanbaru \n Nomor 273 Tahun 2017',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
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
