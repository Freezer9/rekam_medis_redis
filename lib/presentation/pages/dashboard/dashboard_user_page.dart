import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/data/faker/artikel.dart';
import 'package:rekam_medis_redis/data/faker/pasien.dart';
import 'package:rekam_medis_redis/presentation/pages/profile/profile_user_page.dart';
import 'package:rekam_medis_redis/presentation/widgets/artikel_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/patients_widget.dart';

class DashboardUserPage extends ConsumerWidget {
  const DashboardUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(authUserProvider).asData?.value;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.transparent,
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
                            'Hello ${data?.userMetadata?['nama']}',
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
                                builder: (context) => const ProfileUserPage()),
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
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.2,
            bottom: 0,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Riwayat Terakhir',
                        style: TextStyle(
                          color: Color(0xff38608F),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Plus Jakarta Sans',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => ()),
                          // );
                        },
                        child: const Text(
                          'More...',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Plus Jakarta Sans',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    color: Colors.transparent,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return PasienCard(data: patientsData[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.44,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Artikel',
                      style: TextStyle(
                        color: Color(0xff38608F),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Plus Jakarta Sans',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    color: Colors.transparent,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: artikel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ArtikelCard(
                          title: artikel[index]['judul']!,
                          description: artikel[index]['deskripsi']!,
                          image: artikel[index]['image']!,
                          link: artikel[index]['link']!,
                        );
                      },
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
        ],
      ),
    );
  }
}
