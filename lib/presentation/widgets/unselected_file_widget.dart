import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:rekam_medis_redis/themes.dart';

class UnselectedFileWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const UnselectedFileWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: 320,
        height: 110,
        child: DottedBorder(
          color: AppTheme.primaryColor.withOpacity(0.5),
          dashPattern: const [10, 10],
          strokeWidth: 2,
          radius: const Radius.circular(10),
          borderType: BorderType.RRect,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: AppTheme.primaryColor.withOpacity(0.5),
                ),
                Text(
                  "Click to Select File",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppTheme.primaryColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
