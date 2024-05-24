import 'package:flutter/material.dart';
import 'package:flutter_application_1/forget_pw/reset_password_page.dart';
import 'package:flutter_application_1/profile_pasien/profile_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProfilePasienView());
  }
}
