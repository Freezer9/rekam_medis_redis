import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/data/faker/pasien.dart';
import 'package:rekam_medis_redis/presentation/widgets/patients_widget.dart';

class DashboardDokterPage extends ConsumerWidget {
  const DashboardDokterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(authUserProvider).asData?.value;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.only(top: 25),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Halo! Apa Kabar',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              data?.userMetadata?['nama'],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.push('/profile-dokter',
                                extra: data?.userMetadata);
                          },
                          child: Image.asset(
                            "assets/icons/avatar.png",
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
                      child: TextField(
                        onTap: () {
                          context.push('/search-pasien');
                        },
                        decoration: const InputDecoration(
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
                  ],
                ),
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
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    color: Colors.transparent,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: patientsData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              context.push('/riwayat-pasien',
                                  extra: patientsData[index]);
                            },
                            child: PasienCard(data: patientsData[index]));
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
