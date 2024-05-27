import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/themes.dart';

class ProfileDokterPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProfileDokterPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: AppTheme.appBarColor,
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/background.png",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35, right: 35),
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 1.0, color: AppTheme.borderColor),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.2,
                        blurRadius: 2,
                        color: AppTheme.primaryColor,
                      ),
                    ]),
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    buildTextField(
                        'Nama', 'assets/icons/profile.png', data['nama']!),
                    buildTextField('SIP', 'assets/icons/nrp.png', data['sip']),
                    buildTextField('Tanggal Lahir', 'assets/icons/tanggal.png',
                        data['ttl']),
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

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: TextField(
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
    );
  }
}
