import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/widget/searchbar_widget.dart';

class _DashboardAdminState extends StatefulWidget {
  const _DashboardAdminState({super.key});

  @override
  State<_DashboardAdminState> createState() => __DashboardAdminStateState();
}

class __DashboardAdminStateState extends State<_DashboardAdminState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Column(
        children: [
          SearchBarWidget(),
        ],
      ),
    );
  }
}