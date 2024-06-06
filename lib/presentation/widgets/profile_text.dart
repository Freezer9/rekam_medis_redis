import 'package:flutter/material.dart';

Widget buildTextField(String labelText, String iconPath, String data) {
  TextEditingController controller = TextEditingController(text: data);

  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Image.asset(iconPath, width: 24, height: 24),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.horizontal(left: Radius.zero),
          ),
          contentPadding: const EdgeInsets.only(left: 15),
        ),
      ),
    ),
  );
}
