import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rekam_medis_redis/data/models/dokter_model.dart';
import 'package:rekam_medis_redis/data/models/pasien_model.dart';

class DataUserPage extends StatelessWidget {
  final dynamic data;
  const DataUserPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data User"),
        backgroundColor: const Color(0xFFA2C9FE),
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
                    buildTextField(
                        'Nama', 'assets/icons/profile.png', data.nama),
                    if (data is PasienModel)
                      buildTextField(
                          'NRP/NIP', 'assets/icons/nrp.png', data.nrpOrNip),
                    if (data is DokterModel)
                      buildTextField('SIP', 'assets/icons/nrp.png', data.sip),
                    buildTextField(
                        'Tanggal Lahir', 'assets/icons/tanggal.png', data.ttl),
                    if (data is PasienModel)
                      buildTextField('Prodi/Departemen',
                          'assets/icons/prodi.png', data.prodiOrDepartemen),
                    if (data is PasienModel)
                      buildTextField(
                          'Angkatan', 'assets/icons/time.png', data.tahun)
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
                  image: AssetImage("assets/icons/avatar.png"),
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
