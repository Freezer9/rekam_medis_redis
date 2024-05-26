import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/themes.dart';

Widget buttonSimpan() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.black,
      backgroundColor: AppTheme.buttonColor,
      minimumSize: const Size(double.infinity, 35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onPressed: () {},
    child: const Text(
      "SIMPAN",
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
