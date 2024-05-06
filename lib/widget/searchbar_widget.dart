import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Color.fromRGBO(56, 96, 143, 100),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(230, 234, 242, 100),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none),
        hintText: "Search ur debug peeps name",
        suffixIcon: Icon(
          Icons.search,
          color: Color.fromRGBO(185, 187, 236, 100),
        ),
      ),
    );
  }
}
