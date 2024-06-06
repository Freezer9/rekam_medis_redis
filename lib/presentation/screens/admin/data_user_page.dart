import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/data/models/dokter_model.dart';
import 'package:rekam_medis_redis/data/models/pasien_model.dart';
import 'package:rekam_medis_redis/presentation/widgets/profile_text.dart';

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
              SizedBox(
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
                image: const DecorationImage(
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
}
