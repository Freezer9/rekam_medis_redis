import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildInfoRow('Nama', 'assets/profile.png', 'Nama Pengguna'),
        buildDivider(),
        buildInfoRow('NRP', 'assets/nrp.png', '123456789'),
        buildDivider(),
        buildInfoRow('Tanggal Lahir', 'assets/icon.png', '01/01/2000'),
        buildDivider(),
        buildInfoRow('Angkatan', 'assets/time.png', '2020'),
      ],
    );
  }

  Widget buildInfoRow(String labelText, String iconPath, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(iconPath, width: 24, height: 24),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      height: 1,
      width: 300,
      alignment: Alignment.center,
      color: Colors.grey,
    );
  }
}
