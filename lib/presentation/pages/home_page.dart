import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/data/enums/role.dart';
import 'package:rekam_medis_redis/presentation/pages/admin/dashboard_admin_page.dart';
import 'package:rekam_medis_redis/presentation/pages/dokter/dashboard_dokter_page.dart';
import 'package:rekam_medis_redis/presentation/pages/pasien/dashboard_user_page.dart';

class HomePage extends ConsumerWidget {
  final Role role;

  const HomePage({super.key, required this.role});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(authUserProvider).when(
        data: (data) {
          if (role == Role.admin) {
            return const DashboardAdminPage();
          } else if (role == Role.dokter) {
            return const DashboardDokterPage();
          } else {
            return const DashboardUserPage();
          }
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
