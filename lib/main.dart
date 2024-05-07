import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/admin_view/dashboard_page_admin.dart';
import 'package:rekam_medis_redis/dokter_views/dashboard_dr_view.dart';
import 'package:rekam_medis_redis/user_view/dashboard_user.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      home: DashboardUser(),
      ); 
  }
}
