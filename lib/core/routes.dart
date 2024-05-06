import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/view/login.dart';
import 'package:rekam_medis_redis/presentation/pages/home_page.dart';
import 'package:rekam_medis_redis/data/models/user_model.dart';
import 'package:rekam_medis_redis/presentation/pages/select_page.dart';
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
  ],
);
