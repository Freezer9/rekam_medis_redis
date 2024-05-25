// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/data/models/pasien_model.dart';

class PasienCard extends StatelessWidget {
  final PasienModel data;
  String? date;

  PasienCard({
    super.key,
    this.date,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
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
                image: AssetImage("assets/icons/avatar.png"),
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
                  data.nama,
                  style: const TextStyle(
                      color: Color.fromRGBO(25, 28, 32, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  data.nrpOrNip,
                  style: const TextStyle(
                    color: Color.fromRGBO(67, 71, 78, 1),
                    fontSize: 14,
                  ),
                ),
                if (date != null)
                  Text(
                    date ?? 'Belum ada tanggal',
                    style: const TextStyle(
                      color: Color.fromRGBO(67, 71, 78, 1),
                      fontSize: 14,
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
