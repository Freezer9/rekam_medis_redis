import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/domain/admin/artikel_provider.dart';
import 'package:rekam_medis_redis/domain/pasien/riwayat_provider.dart';
import 'package:rekam_medis_redis/presentation/widgets/artikel_card.dart';
import 'package:rekam_medis_redis/presentation/widgets/error_message.dart';
import 'package:rekam_medis_redis/presentation/widgets/pasien_record_card.dart';

class DashboardUserPage extends ConsumerStatefulWidget {
  const DashboardUserPage({super.key});

  @override
  ConsumerState<DashboardUserPage> createState() => _DashboardUserPageState();
}

class _DashboardUserPageState extends ConsumerState<DashboardUserPage> {
  @override
  void initState() {
    super.initState();
    ref.read(artikelNotifierProvider.notifier).getAllArtikel();
  }

  @override
  Widget build(BuildContext context) {
    final artikel = ref.watch(artikelNotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ref.watch(authUserProvider).when(
        data: (user) {
          if (user == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
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
                                user.userMetadata!['nama'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              context.push('/profile-user');
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
                    subtitleSection(
                      context,
                      title1: "Riwayat Terakhir",
                      title2: "Lihat Lainnya..",
                      onTap: () => context.push('/riwayat-rekam-medis'),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        color: Colors.transparent,
                        child: ref
                            .watch(getPasienRecordProvider(id: user.id))
                            .when(
                          data: (data) {
                            if (data.isEmpty) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: const Text('Tidak ada histori pasien',
                                    style: TextStyle(fontSize: 16)),
                              );
                            }

                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                final pasienData = data.last;
                                return GestureDetector(
                                  onTap: () => context.push('/detail-pasien',
                                      extra: pasienData["record"]),
                                  child: PasienRecordCard(
                                      dokter: pasienData["dokter"],
                                      data: pasienData["record"],
                                      user: user),
                                );
                              },
                            );
                          },
                          error: (error, stackTrace) {
                            return errorMessage();
                          },
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ),
                    subtitleSection(
                      context,
                      title1: "Pengumuman",
                      title2: "Lihat Lainnya..",
                      onTap: () => context.push('/detail-artikel'),
                    ),
                    Expanded(
                      flex: 5,
                      child: artikel.isNotEmpty
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: min(artikel.length, 1),
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              itemBuilder: (context, index) {
                                final data = artikel.last;

                                return ArtikelCard(data: data);
                              },
                            )
                          : errorMessage(message: "Tidak ada pengumuman"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          return errorMessage();
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget subtitleSection(
    BuildContext context, {
    String? title1,
    String? title2,
    void Function()? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title1!,
            style: const TextStyle(
              color: Color(0xff38608F),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              title2!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
