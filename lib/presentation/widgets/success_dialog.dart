import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/auth/api/auth_repository.dart';
import 'package:rekam_medis_redis/core/utils.dart';

class SuccessDialog extends ConsumerWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 400,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 320,
          height: 170,
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(Icons.lock_person, size: 60, color: Colors.black),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PASSWORD DIPERBARUI",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Silakan masuk kembali.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 280,
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ref.read(authRepositoryProvider).signOut();
                    context.clearAndNavigate('/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFCE186),
                    foregroundColor: Colors.black,
                    minimumSize: const Size(280, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  icon: const Icon(Icons.login),
                  label: const Text(
                    'MASUK',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
