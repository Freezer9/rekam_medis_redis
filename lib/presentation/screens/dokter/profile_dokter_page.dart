import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_lupa_password.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_sign_out.dart';
import 'package:rekam_medis_redis/presentation/widgets/profile_text.dart';

class ProfileDokterPage extends ConsumerWidget {
  const ProfileDokterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFFA2C9FE),
      ),
      body: ref.watch(authUserProvider).when(
        data: (user) {
          if (user == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
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
                        ]),
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        buildTextField('Nama', 'assets/icons/profile.png',
                            user.userMetadata!["nama"] ?? ''),
                        buildTextField('SIP', 'assets/icons/nrp.png',
                            user.userMetadata!['sip']! ?? ''),
                        buildTextField(
                            'Tanggal Lahir',
                            'assets/icons/tanggal.png',
                            user.userMetadata!['ttl']! ?? ''),
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
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
