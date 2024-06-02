import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/data/enums/role.dart';
import 'package:rekam_medis_redis/presentation/screens/admin/dashboard_admin_page.dart';
import 'package:rekam_medis_redis/presentation/screens/dokter/dashboard_dokter_page.dart';
import 'package:rekam_medis_redis/presentation/screens/pasien/dashboard_user_page.dart';

class HomePage extends StatelessWidget {
  final Role role;

  const HomePage({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    if (role == Role.admin) {
      return const DashboardAdminPage();
    } else if (role == Role.dokter) {
      return const DashboardDokterPage();
    } else {
      return const DashboardUserPage();
    }
  }
}
