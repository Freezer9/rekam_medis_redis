import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/themes.dart';

Widget customTextField() {
  return TextField(
    controller: TextEditingController(),
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    ),
    onSubmitted: (value) {
      print(value);
    },
  );
}
