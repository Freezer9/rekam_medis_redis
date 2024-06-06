import 'package:flutter/material.dart';

Widget errorMessage({String? message = "Error Loading Data"}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline),
        const SizedBox(height: 5),
        Text(message!, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}
