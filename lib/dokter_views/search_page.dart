import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            SizedBox(width: 8),
          ],
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 18),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
            ),
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                contentPadding: EdgeInsetsDirectional.fromSTEB(0, 20, 16, 12),
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(
                  fontSize: 20,
                  color:Colors.black,
                ),
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.0), 
          child: Container(
            color: Colors.black, 
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
