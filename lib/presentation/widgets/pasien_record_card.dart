// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rekam_medis_redis/data/models/dokter_model.dart';
import 'package:rekam_medis_redis/data/models/record_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PasienRecordCard extends StatelessWidget {
  final RecordModel data;
  final DokterModel? dokter;
  final User user;

  const PasienRecordCard({
    super.key,
    required this.user,
    this.dokter,
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
                  dokter!.nama,
                  style: const TextStyle(
                      color: Color.fromRGBO(25, 28, 32, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMMMMEEEEd("id_ID")
                      .format(DateTime.parse(data.createdAt!))
                      .toString(),
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
