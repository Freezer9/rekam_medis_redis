import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  SuccessDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 320,
        height: 180,
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              width: 320,
              height: 10,
              child: Image.asset(
                "assets/bg.png",
                fit: BoxFit.fill,
              ),
            ),
            Row(
              children: [
                Icon(Icons.lock_person, size: 60, color: Colors.black),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PASSWORD DIPERBARUI",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Silakan masuk kembali.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 280,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFCE186),
                  foregroundColor: Colors.black,
                  minimumSize: Size(280, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                icon: Icon(Icons.login),
                label: Text(
                  'MASUK',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}