import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_lupa_password.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_sign_out.dart';
import 'package:rekam_medis_redis/presentation/widgets/profile_text.dart';

class ProfileUserPage extends ConsumerWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFFA2C9FE),
      ),
      body: ref.watch(authUserProvider).when(
        data: (data) {
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Stack(
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
                      width: width * 0.85,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.0, color: const Color(0xffC3C6CF)),
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
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          buildTextField('Nama', 'assets/icons/profile.png',
                              data.userMetadata?['nama']),
                          buildTextField(
                              'NRP',
                              'assets/icons/nrp.png',
                              data.userMetadata?['nrp'] ??
                                  data.userMetadata?['nip']),
                          buildTextField(
                              'Tempat, Tanggal Lahir',
                              'assets/icons/tanggal.png',
                              data.userMetadata?['ttl']),
                          buildTextField(
                              'Program Studi',
                              'assets/icons/prodi.png',
                              data.userMetadata?['prodi'] ??
                                  data.userMetadata?['departemen']),
                          buildTextField('Angkatan', 'assets/icons/time.png',
                              data.userMetadata!['tahun'].toString()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ButtonLupaPassword(width: width),
                    ButtonSignOut(width: width),
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
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
