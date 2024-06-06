import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/core/utils.dart';

class ButtonSignOut extends ConsumerWidget {
  const ButtonSignOut({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(authRepositoryProvider).signOut();
        context.clearAndNavigate('/');
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 20),
        width: width * 0.85,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.red,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/logout.png', color: Colors.white),
            const SizedBox(width: 5),
            const Text("Keluar", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
