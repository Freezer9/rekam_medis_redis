import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/presentation/pages/dashboard/dashboard_dokter_page.dart';

class ProfileDokterPage extends StatelessWidget {
  const ProfileDokterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
        ),
        backgroundColor: const Color(0xFFA2C9FE),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashboardDokterPage()),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: width * 0.9,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1.0, color: const Color(0xffC3C6CF)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.2,
                        blurRadius: 2,
                        color: Color(0xFF38608F),
                      ),
                    ]),
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    buildTextField('Nama', 'assets/icons/profile.png', 'Faris'),
                    buildTextField('NRP', 'assets/icons/nrp.png', '3122600044'),
                    buildTextField('Tanggal Lahir', 'assets/icons/tanggal.png',
                        'Jepang, 08 Februari 2004'),
                    buildTextField('Program Studi', 'assets/icons/prodi.png',
                        'D4 Teknik Mekatronika'),
                    buildTextField('Angkatan', 'assets/icons/time.png', '2021'),
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
                image: const DecorationImage(
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
          padding: const EdgeInsets.only(bottom: 30),
          child: TextField(
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              labelText: labelText,
              prefixIcon: Image.asset(iconPath, width: 24, height: 24),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.horizontal(left: Radius.zero),
              ),
              contentPadding: const EdgeInsets.only(left: 15),
            ),
          ),
        ),
      ),
    );
  }
}
