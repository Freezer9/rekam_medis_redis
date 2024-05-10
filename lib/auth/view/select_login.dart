import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/data/enums/role.dart';

class SelectLogin extends StatefulWidget {
  const SelectLogin({super.key});

  @override
  State<SelectLogin> createState() => _SelectLoginState();
}

class _SelectLoginState extends State<SelectLogin> {
  int? currentSelected;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB8D9F3),
              Color(0xFFDDEEFD),
            ],
            stops: [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: OverflowBox(
                  alignment: Alignment.bottomCenter,
                  maxWidth: width * 2,
                  maxHeight: height,
                  child: Container(
                    width: width * 1.7,
                    height: height * 0.74,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width),
                        topRight: Radius.circular(width),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Image.asset(
                  'assets/images/pens.png',
                  width: 85,
                  height: 80,
                ),
              ),
              selectRole(height, 0.65, 'assets/icons/dosenmahasiswa.png',
                  'Mahasiswa\n/ Dosen',
                  index: Role.pasien.index),
              selectRole(height, 0.55, 'assets/icons/dokter.png', 'Dokter',
                  right: 20, index: Role.dokter.index),
              selectRole(height, 0.55, 'assets/icons/admin.png', 'Admin',
                  left: 20, index: Role.admin.index),
              Positioned(
                bottom: 230,
                child: Image.asset(
                  'assets/images/select_login.png',
                  width: 135,
                  height: 135,
                ),
              ),
              Positioned(
                bottom: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Pilih status Anda lalu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          'Klik tombol LOGIN di bawah ini',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 35),
                        GestureDetector(
                          onTap: currentSelected == null
                              ? null
                              : () => context.push('/login/$currentSelected'),
                          child: Container(
                            decoration: BoxDecoration(
                              color: currentSelected == null
                                  ? Colors.grey
                                  : const Color(0xFF5195D6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ).copyWith(right: 12),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectRole(double height, double times, String asset, String text,
      {double? left, double? right, int index = 1}) {
    return Positioned(
      height: height * times,
      left: left,
      right: right,
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentSelected = index;
          });
        },
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              padding: const EdgeInsets.all(16),
              width: currentSelected == index ? 100 : 80,
              height: currentSelected == index ? 100 : 80,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              child: Image.asset(
                asset,
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5699D7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
