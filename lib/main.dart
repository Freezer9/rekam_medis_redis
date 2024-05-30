import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rekam_medis_redis/core/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://kytlboobxypxkuaesorc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt5dGxib29ieHlweGt1YWVzb3JjIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcxNDYyMTY0MCwiZXhwIjoyMDMwMTk3NjQwfQ.B6UaLEkld-fWPhVKsxvrMN4H-NC43VMd5VHYUjRfni8',
  );
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(const ProviderScope(child: MainApp())),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.read(routeProvider);
    return MaterialApp.router(
      title: "Supabase Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        fontFamily: 'Plus Jakarta Sans',
        primarySwatch: Colors.blue,
      ),
      routerConfig: routes,
    );
  }
}
