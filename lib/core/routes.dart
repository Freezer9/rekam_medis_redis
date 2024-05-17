import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/view/login.dart';
import 'package:rekam_medis_redis/auth/view/select_login.dart';
import 'package:rekam_medis_redis/presentation/pages/profile/profile_dokter_page.dart';
import 'package:rekam_medis_redis/presentation/pages/user/admin/input_data_page.dart';
import 'package:rekam_medis_redis/presentation/pages/home_page.dart';
import 'package:rekam_medis_redis/data/enums/role.dart';
import 'package:rekam_medis_redis/presentation/pages/user/dokter/detail_riwayat_page.dart';
import 'package:rekam_medis_redis/presentation/pages/user/dokter/input_obat_test.dart';
import 'package:rekam_medis_redis/presentation/pages/user/dokter/riwayat_pasien_page.dart';
import 'package:rekam_medis_redis/presentation/pages/user/pasien/riwayat_rekam_medis_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@riverpod
route(RouteRef _) => _routes;

final _routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SelectLogin(),
    ),
    GoRoute(
      path: '/login/:role',
      builder: (context, state) => LoginPage(
        role: Role.values[int.parse(state.pathParameters['role']!)],
      ),
    ),
    GoRoute(
      path: '/home/:role',
      builder: (context, state) => HomePage(
        role: Role.values[int.parse(state.pathParameters['role']!)],
      ),
    ),
    GoRoute(
      path: '/inputdata',
      builder: (context, state) => const InputData(),
    ),
    GoRoute(
      path: '/detail-pasien',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;
        return DetailRiwayatPage(data: data);
      },
    ),
    GoRoute(
      path: '/profile-dokter',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return ProfileDokterPage(data: data);
      },
    ),
    GoRoute(
      path: '/riwayat-pasien',
      builder: (context, state) {
        final data = state.extra as Map<String, String>;
        return RiwayatPasienPage(data: data);
      },
    ),
    GoRoute(
      path: '/riwayat-rekam-medis',
      builder: (context, state) => const RiwayatRekamMedisPage(),
    ),
    GoRoute(
      path: '/input-obat',
      builder: (context, state) {
        // final data = state.extra as Map<String, dynamic>;
        return InputObatTest();
      },
    )
  ],
);
