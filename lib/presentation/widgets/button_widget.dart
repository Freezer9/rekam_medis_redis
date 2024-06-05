import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/constant/themes.dart';

Widget buttonSimpan({
  Function()? onPressed,
  Color btnColor = buttonColor,
  Color textColor = Colors.black,
  String text = "SIMPAN",
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.black,
      backgroundColor: btnColor,
      minimumSize: const Size(double.infinity, 35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
