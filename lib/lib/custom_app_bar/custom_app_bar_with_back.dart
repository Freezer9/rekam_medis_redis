import 'package:flutter/material.dart';

class CustomAppBarBack extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? leadingOnPressed;

  const CustomAppBarBack({
    Key? key,
    required this.title,
    this.leadingOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Color(0xFFA2C9FE),
      centerTitle: true,
      leading: IconButton(
        onPressed: leadingOnPressed,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
