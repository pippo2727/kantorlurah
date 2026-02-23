import 'package:flutter/material.dart';
import 'package:kantor_lurah/core.dart';

class DomisiliScreen extends StatelessWidget {
  const DomisiliScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Data data = listData[9];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8, 20, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TitleApp(),
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
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          data.title!,
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
