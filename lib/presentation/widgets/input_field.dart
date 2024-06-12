// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  String validatorMessage;
  bool isSubmitting;
  bool obscureText;

  InputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validatorMessage,
    required this.isSubmitting,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      readOnly: isSubmitting,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorMessage;
        }

        return null;
      },
    );
  }
}
