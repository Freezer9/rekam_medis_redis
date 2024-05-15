import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/presentation/pages/user/dokter/input_obat_page.dart';
import 'package:rekam_medis_redis/presentation/pages/user/pasien/riwayat_rekam_medis.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RiwayatRekamMedisPasien()
    );
  }
}