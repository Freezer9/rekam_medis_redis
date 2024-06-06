import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonLupaPassword extends StatelessWidget {
  const ButtonLupaPassword({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/lupa-password');
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 20),
        width: width * 0.85,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1.0, color: Colors.black),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/lupa.png'),
            const SizedBox(width: 5),
            const Text("Lupa Password"),
          ],
        ),
      ),
    );
  }
}
