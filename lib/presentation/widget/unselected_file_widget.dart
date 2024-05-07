import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class UnselectedFileWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const UnselectedFileWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: 320,
        height: 110,
        child: DottedBorder(
          color: Color(0xFF38608F).withOpacity(0.5),
          dashPattern: [10, 10],
          strokeWidth: 2,
          radius: Radius.circular(10),
          borderType: BorderType.RRect,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Color(0xFF38608F).withOpacity(0.5),
                ),
                Text(
                  "Click to Select File",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF38608F).withOpacity(0.5),
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
