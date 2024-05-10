import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/data/faker/pasien.dart';
import 'package:rekam_medis_redis/presentation/pages/profile/profile_dokter_page.dart';
import 'package:rekam_medis_redis/presentation/widgets/patients_card.dart';

class DashboardDokterPage extends ConsumerWidget {
  const DashboardDokterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(authUserProvider).asData?.value;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello ${data?.email}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'How Was ur day?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ProfileDokterPage()),
                          );
                        },
                        child: Image.asset(
                          "assets/Image1.png",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(230, 234, 242, 1),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Ini apa ya?',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authRepositoryProvider).signOut();
                      Navigator.pop(context);
                    },
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Rekam Medis Terbaru...',
                      style: TextStyle(
                        color: Color.fromARGB(255, 210, 228, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(top: 20),
                    color: Colors.transparent,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: patientsData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return WidgetUtils.buildPasienCard(
                          patientsData[index]['name']!,
                          patientsData[index]['id']!,
                          patientsData[index]['date']!,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
