import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:rekam_medis_redis/themes.dart';

class SelectedFile extends StatelessWidget {
  final File selectedFile;
  final Function() onDelete;

  const SelectedFile({
    super.key,
    required this.selectedFile,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: const EdgeInsets.all(17.0),
      width: 320,
      height: 110,
      decoration: BoxDecoration(
        color: AppTheme.buttonColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/icons/csv-icon.png',
            height: 50,
            width: 50,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              path.basename(selectedFile.path),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color:AppTheme.deleteButtonColor,
            ),
            onPressed: onDelete,
          )
        ],
      ),
    );
  }
}
