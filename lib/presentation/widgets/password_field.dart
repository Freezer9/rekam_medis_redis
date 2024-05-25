import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final ValueChanged<bool> onObscureTextChanged;
  final String? errorMessage;

  PasswordField({
    required this.labelText,
    required this.controller,
    required this.obscureText,
    required this.onObscureTextChanged,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300, // Menjadi lebih tipis
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 280,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: obscureText
                  ? 'Masukkan password'
                  : 'Masukkan password', // Placeholder text
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  onObscureTextChanged(!obscureText);
                },
              ),
            ),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        if (errorMessage != null) const SizedBox(height: 5),
        if (errorMessage != null)
          Text(
            errorMessage!,
            style: const TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
