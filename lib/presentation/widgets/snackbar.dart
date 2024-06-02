import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.fixed,
  );
}

SnackBar buildSuccessSnackBar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.fixed,
  );
}
