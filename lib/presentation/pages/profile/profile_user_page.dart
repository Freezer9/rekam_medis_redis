import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileUserPage extends StatelessWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
        ),
        backgroundColor: Color(0xFFA2C9FE),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/background.png",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Color(0xffC3C6CF)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0.2,
                        blurRadius: 2,
                        color: Color(0xFF38608F),
                      ),
                    ]),
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    buildTextField('Nama', 'assets/profile.png', 'Faris'),
                    buildTextField('NRP', 'assets/nrp.png', '3122600044'),
                    buildTextField('Tanggal Lahir', 'assets/icon.png',
                        'Jepang, 08 Februari 2004'),
                    buildTextField('Program Studi', 'assets/prodi.png',
                        'D4 Teknik Mekatronika'),
                    buildTextField('Angkatan', 'assets/time.png', '2021'),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2024/01/25/03/16/capuchin-monkey-8530884_640.jpg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, String iconPath, String data) {
    TextEditingController controller = TextEditingController(text: data);

    return Container(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: TextField(
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              labelText: labelText,
              prefixIcon: Image.asset(iconPath, width: 24, height: 24),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.horizontal(left: Radius.zero),
              ),
              contentPadding: EdgeInsets.only(left: 15),
            ),
          ),
        ),
      ),
    );
  }
}
