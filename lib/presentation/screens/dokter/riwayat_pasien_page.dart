import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/data/models/pasien_model.dart';
import 'package:rekam_medis_redis/domain/dokter/history_pasien_provider.dart';
import 'package:rekam_medis_redis/presentation/widgets/pasien_card.dart';

class RiwayatPasienPage extends ConsumerWidget {
  final PasienModel user;
  const RiwayatPasienPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Rekam Medis"),
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
                child: ref.watch(getHistoryPasienProvider(user.id)).when(
                  data: (data) {
                    if (data.isEmpty) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: const Text('Tidak ada histori pasien'),
                      );
                    }

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final patientData = data[index];
                        return GestureDetector(
                          onTap: () {
                            context.push('/detail-pasien', extra: patientData);
                          },
                          child: PasienCard(
                              data: user, date: patientData.createdAt),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return Center(
                      child: Text('Error: $error'),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/input-data-pasien', extra: user);
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
          image: AssetImage("assets/icons/avatar.png"),
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
          _buildTextField('Nama', 'assets/icons/profile.png', user.nama),
          _buildTextField('NRP / NIP', 'assets/icons/nrp.png', user.nrpOrNip),
          _buildTextField(
              'Tanggal Lahir', 'assets/icons/tanggal.png', user.ttl),
          _buildTextField('Program Studi / Departemen',
              'assets/icons/prodi.png', user.prodiOrDepartemen),
          _buildTextField('Angkatan', 'assets/icons/time.png', user.tahun),
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
