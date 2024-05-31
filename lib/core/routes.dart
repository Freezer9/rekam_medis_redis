import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/view/login.dart';
import 'package:rekam_medis_redis/auth/view/select_login.dart';
import 'package:rekam_medis_redis/data/models/pasien_model.dart';
import 'package:rekam_medis_redis/data/models/record_model.dart';
import 'package:rekam_medis_redis/presentation/screens/admin/data_user_page.dart';
import 'package:rekam_medis_redis/presentation/screens/dokter/input_data_page.dart';
import 'package:rekam_medis_redis/presentation/screens/dokter/profile_dokter_page.dart';
import 'package:rekam_medis_redis/presentation/screens/admin/input_data_page.dart';
import 'package:rekam_medis_redis/presentation/screens/dokter/search_pasien_page.dart';
import 'package:rekam_medis_redis/presentation/screens/home_page.dart';
import 'package:rekam_medis_redis/data/enums/role.dart';
import 'package:rekam_medis_redis/presentation/screens/admin/search_user_page.dart';
import 'package:rekam_medis_redis/presentation/screens/dokter/detail_riwayat_page.dart';
import 'package:rekam_medis_redis/presentation/screens/dokter/riwayat_pasien_page.dart';
import 'package:rekam_medis_redis/presentation/screens/pasien/lupa_password_page.dart';
import 'package:rekam_medis_redis/presentation/screens/pasien/profile_user_page.dart';
import 'package:rekam_medis_redis/presentation/screens/pasien/search_riwayat_medis_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@riverpod
dynamic route(RouteRef _) => _routes;

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
      path: '/input-data',
      builder: (context, state) {
        final data = state.extra as String;
        return InputDataPage(data: data);
      },
    ),
    GoRoute(
      path: '/detail-pasien',
      builder: (context, state) {
        final data = state.extra as RecordModel;
        return DetailRiwayatPage(record: data);
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
      path: '/profile-user',
      builder: (context, state) => const ProfileUserPage(),
    ),
    GoRoute(
      path: '/riwayat-pasien',
      builder: (context, state) {
        final data = state.extra as PasienModel;
        return RiwayatPasienPage(user: data);
      },
    ),
    GoRoute(
      path: '/riwayat-rekam-medis',
      builder: (context, state) => const SearchRiwayatMedisPage(),
    ),
    GoRoute(
      path: '/search-user',
      builder: (context, state) => const SearchUserPage(),
    ),
    GoRoute(
      path: '/search-pasien',
      builder: (context, state) => const SearchPasienPage(),
    ),
    GoRoute(
      path: '/lupa-password',
      builder: (context, state) => const LupaPasswordPage(),
    ),
    GoRoute(
      path: '/data-user',
      builder: (context, state) {
        final data = state.extra as PasienModel;
        return DataUserPage(data: data);
      },
    ),
    GoRoute(
      path: '/input-data-pasien',
      builder: (context, state) {
        final data = state.extra as PasienModel;
        return InputDataMedisPage(pasien: data);
      },
    ),
  ],
);
