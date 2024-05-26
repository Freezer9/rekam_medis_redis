import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/data/faker/pasien.dart';
import 'package:rekam_medis_redis/presentation/widgets/patients_widget.dart';

class RiwayatPasienPage extends StatelessWidget {
  final Map<String, dynamic> user;
  const RiwayatPasienPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final filteredPatients =
        patientsData.where((data) => data['nama'] == user['nama']).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            const Text("Riwayat Rekam Medis", style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileImage(),
              const SizedBox(height: 15),
              SizedBox(
                width: width * 0.8,
                child: _buildProfileInfo(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Data Historis",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  children: filteredPatients.map((data) {
                    return GestureDetector(
                        onTap: () {
                          context.push('/detail-pasien', extra: data);
                        },
                        child: PasienCard(data: data));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/input-data-pasien');
        },
        backgroundColor: const Color(0xFFD2E4FF),
        elevation: 4,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 130,
      height: 130,
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 10,
            color: Colors.black12,
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
    );
  }

  Widget _buildProfileInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: const Color(0xffC3C6CF)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            spreadRadius: 0.2,
            blurRadius: 2,
            color: Color(0xFF38608F),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          _buildTextField('Nama', 'assets/icons/profile.png', user['nama']!),
          _buildTextField('NRP', 'assets/icons/nrp.png', user['nrp']!),
          _buildTextField(
              'Tanggal Lahir', 'assets/icons/tanggal.png', user['ttl']),
          _buildTextField(
              'Program Studi', 'assets/icons/prodi.png', user['prodi']),
          _buildTextField(
              'Angkatan', 'assets/icons/time.png', user['tahun'].toString()),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, String iconPath, String data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        controller: TextEditingController(text: data),
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
    );
  }
}
