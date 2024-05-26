import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/domain/dokter/pasien_notifier.dart';
import 'package:rekam_medis_redis/presentation/widgets/patients_widget.dart';

class DashboardDokterPage extends ConsumerStatefulWidget {
  const DashboardDokterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardDokterPageState();
}

class _DashboardDokterPageState extends ConsumerState<DashboardDokterPage> {
  @override
  Widget build(BuildContext context) {
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
                    GestureDetector(
                      onTap: () => context.push('/search-pasien'),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1),
                              color: Colors.white),
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Cari Pasien Anda",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          )),
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
                    child: ref
                        .watch(getAllPasienProvider(data?.userMetadata?['id']))
                        .when(
                      data: (data) {
                        if (data.isEmpty) {
                          return const Center(
                            child: Text('Tidak ada data pasien'),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final patientData = data[index];
                            return GestureDetector(
                              onTap: () async {
                                context.push('/riwayat-pasien',
                                    extra: patientData);
                              },
                              child: PasienCard(data: patientData),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
