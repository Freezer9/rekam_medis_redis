import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/widget/data_pasien_bella.dart';

void main() {
  runApp(TestMainApp());
}

class TestMainApp extends StatelessWidget {
  const TestMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'KonsulDok',
      debugShowCheckedModeBanner: false,
      home: DataPasien(),
      );
    }
}