import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class SelectedFile extends StatelessWidget {
  final File selectedFile;
  final Function() onDelete;

  const SelectedFile({
    Key? key,
    required this.selectedFile,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.all(17.0),
      width: 320,
      height: 110,
      decoration: BoxDecoration(
        color: Color(0xFF5195D6),
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
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              path.basename(selectedFile.path),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Color(0xFFBA1A1A),
            ),
            onPressed: onDelete,
          )
        ],
      ),
    );
  }
}
