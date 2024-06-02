import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/core/utils.dart';

class ProfileUserPage extends ConsumerWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(authUserProvider).asData?.value;

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFFA2C9FE),
      ),
      body: SingleChildScrollView(
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
                    ],
                  ),
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      buildTextField('Nama', 'assets/icons/profile.png',
                          data?.userMetadata?['nama']),
                      buildTextField(
                          'NRP',
                          'assets/icons/nrp.png',
                          data?.userMetadata?['nrp'] ??
                              data?.userMetadata?['nip']),
                      buildTextField(
                          'Tempat, Tanggal Lahir',
                          'assets/icons/tanggal.png',
                          data?.userMetadata?['ttl']),
                      buildTextField(
                          'Program Studi',
                          'assets/icons/prodi.png',
                          data?.userMetadata?['prodi'] ??
                              data?.userMetadata?['departemen']),
                      buildTextField('Angkatan', 'assets/icons/time.png',
                          data?.userMetadata!['tahun'].toString() ?? ''),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    context.push('/lupa-password');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 20),
                    width: width * 0.85,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(width: 1.0, color: Colors.black),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/lupa.png'),
                        const SizedBox(width: 5),
                        const Text("Lupa Password"),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(authRepositoryProvider).signOut();
                    context.clearAndNavigate('/');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 20),
                    width: width * 0.85,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/logout.png',
                            color: Colors.white),
                        const SizedBox(width: 5),
                        const Text("Keluar",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
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
