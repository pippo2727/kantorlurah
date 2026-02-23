import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project_kantor_lurah/pages/main_page.dart';
import 'package:project_kantor_lurah/widgets/button.dart';
import 'package:project_kantor_lurah/widgets/greeting.dart';
import 'package:project_kantor_lurah/widgets/office_name.dart';
import 'package:project_kantor_lurah/widgets/title_app.dart';

class FirstScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/image/image2.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.63,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(66),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleApp(
                          isCenter: true,
                        ),
                        OfficeName(
                          isCenter: true,
                        )
                      ],
                    ),
                  ),
                  Greeting(),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(17, 3, 0, 0),
                    child: Text(
                      'MASUKKAN NAMA ANDA',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Nama Anda...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Button(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainPage(name: nameController.text);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
