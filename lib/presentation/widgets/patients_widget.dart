import 'package:flutter/material.dart';

class WidgetUtils {
  static Widget buildPasienCard(String name, String id, String date) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
          ),
        ],
        color: Colors.white,
        border: Border.all(
          color: const Color.fromRGBO(210, 228, 255, 1),
          width: 1,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/Image1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                    color: Color.fromRGBO(25, 28, 32, 1),
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  id,
                  style: const TextStyle(
                    color: Color.fromRGBO(67, 71, 78, 1),
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 12,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Color.fromRGBO(67, 71, 78, 1),
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
