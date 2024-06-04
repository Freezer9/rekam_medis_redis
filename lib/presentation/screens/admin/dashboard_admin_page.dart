import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/api/auth_repository.dart';
import 'package:rekam_medis_redis/core/utils.dart';

class DashboardAdminPage extends ConsumerWidget {
  const DashboardAdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Sepuh 🙏',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
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
                      Image.network(
                        'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => context.push('/search-user'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(230, 234, 242, 1),
                      ),
                      child: const TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'search user',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Input data...',
                    style: TextStyle(
                      color: Color.fromARGB(255, 210, 228, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.push('/input-data', extra: 'Pasien');
                          },
                          child: Card(
                            color: const Color(0xFFD2E4FF),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/circle_acc.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Input Data Pasien',
                                    style: TextStyle(
                                      color: Color(0xFF38608F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push('/input-data', extra: 'Dokter');
                          },
                          child: Card(
                            color: const Color(0xFFD2E4FF),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/circle_acc.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Input Data Dokter',
                                    style: TextStyle(
                                      color: Color(0xFF38608F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
            ),
          ),
        ],
      ),
    );
  }
}
