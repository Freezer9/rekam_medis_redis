import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/domain/pasien/riwayat_provider.dart';
import 'package:rekam_medis_redis/presentation/widgets/pasien_record_card.dart';

class DashboardUserPage extends ConsumerWidget {
  const DashboardUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ref.watch(authUserProvider).when(
        data: (user) {
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
                                user!.userMetadata!['nama'],
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Riwayat Terakhir',
                            style: TextStyle(
                              color: Color(0xff38608F),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: GestureDetector(
                            onTap: () {
                              context.push('/riwayat-rekam-medis');
                            },
                            child: const Text(
                              'More...',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
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
                        child: ref
                            .watch(getPasienRecordProvider(id: user.id))
                            .when(
                          data: (data) {
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
                                        user: user));
                              },
                            );
                          },
                          error: (error, stackTrace) {
                            return Text(error.toString());
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
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text('Error: $error'));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
