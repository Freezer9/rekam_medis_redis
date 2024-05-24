import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.asset(
        "assets/background.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
