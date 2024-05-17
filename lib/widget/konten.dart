import 'package:flutter/material.dart';

class Konten extends StatelessWidget {
  final String text;
  final dynamic isiKonten;

  const Konten({super.key, required this.text, this.isiKonten});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
          isiKonten,
        ],
      ),
    );
  }
}
