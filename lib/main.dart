import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/core/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/presentation/pages/input_data_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://kytlboobxypxkuaesorc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt5dGxib29ieHlweGt1YWVzb3JjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ2MjE2NDAsImV4cCI6MjAzMDE5NzY0MH0.UUDbjzq3iUZQxk-LOn4UrpNR8FEAbGprzo4zrKYF4tA',
  );
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.read(routeProvider);
    return MaterialApp.router(
    //   return MaterialApp(
      title: "Supabase Flutter",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: InputData(),
      routerConfig: routes,
    );
  }
}
