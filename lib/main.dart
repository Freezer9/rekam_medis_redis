import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/dokter_views/dashboard_dr_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      home: DasboardDokterView(),
      );
  }
}
