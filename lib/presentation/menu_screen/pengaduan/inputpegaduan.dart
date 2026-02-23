import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_kantor_lurah/pages/menu_screen/pengaduan/pengaduan.dart';
import 'package:project_kantor_lurah/widgets/footer.dart';
import 'package:project_kantor_lurah/widgets/menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_kantor_lurah/widgets/office_name.dart';
import 'package:project_kantor_lurah/widgets/title_app.dart';
import 'package:project_kantor_lurah/widgets/welcome.dart';
import 'package:project_kantor_lurah/pages/menu_screen/persyaratan/menupersyaratan/sktm_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class inputpengaduan extends StatelessWidget {
  String name;
  // List of carousel image
  final List<String> imgList = [
    'assets/image/image1.jpg',
    'assets/image/image2.jpg',
    'assets/image/image3.jpg',
  ];

  inputpengaduan({Key? key, required this.name}) : super(key: key);

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
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.teal,
                      ),
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
                  thickness: 2,
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 0,
              //     vertical: 5,
              //   ),
              //   child: Divider(
              //     thickness: 20,
              //   ),
              // ),

              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 5,
                ),
                child: Divider(
                  thickness: 20,
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 400,
                        child: Text(
                          'DATA PELAPOR',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextFormField(
                        initialValue: '',
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "Masukan Nama Lengkap",
                        ),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 5,
                ),
                child: Divider(
                  thickness: 20,
                ),
              ),
              ////////////////////////////////BUTTON NAMA //////////////////////////
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: '',
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "Masukan Nama Lengkap",
                        ),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ),

              ////////////////////////////////BUTTON tanggal//////////////////////////
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          print("pickedDate: $pickedDate");
                        },
                        child: TextFormField(
                          initialValue: '',
                          maxLength: 20,
                          enabled: false,
                          decoration: const InputDecoration(
                            labelText: 'Tanggal',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            suffixIcon: Icon(Icons.date_range),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //////////////// button alamat
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: '',
                        maxLength: 200,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: 'Alamat ',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "Masukan Alamat ",
                        ),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ),

              /////button jam////////////
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                            builder: (context, child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: true),
                                child: child ?? Container(),
                              );
                            },
                          );
                          print("pickedTime: $pickedTime");
                        },
                        child: TextFormField(
                          initialValue: '08:23',
                          maxLength: 20,
                          enabled: false,
                          decoration: const InputDecoration(
                            labelText: 'Jam ',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            suffixIcon: Icon(Icons.timer),
                            helperText: "What's your name?",
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () async {
                  //dialog
                  // DateTime? pickedDate = await showDatePicker(
                  //   context: context,
                  //   initialDate: DateTime.now(),
                  //   firstDate: DateTime(2000),
                  //   lastDate: DateTime(2100),
                  // );
                  // print("pickedDate: $pickedDate");
                },
                child: const Text("Upload"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
