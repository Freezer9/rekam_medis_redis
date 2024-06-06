import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rekam_medis_redis/constant/themes.dart';
import 'package:rekam_medis_redis/core/utils.dart';
import 'package:rekam_medis_redis/data/models/artikel_model.dart';

class ArtikelCard extends StatelessWidget {
  final ArtikelModel data;
  final bool substring;

  const ArtikelCard({
    super.key,
    required this.data,
    this.substring = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: containerColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.judul,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Image.network(
              getSupabaseImage(data.image),
              width: double.infinity,
              fit: BoxFit.fitWidth,
              height: 200,
            ),
            const SizedBox(height: 5),
            Text(
              DateFormat.yMMMMEEEEd("id_ID")
                  .format(DateTime.parse(data.createdAt))
                  .toString(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: primarycolor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              substring
                  ? data.isi.length > 90
                      ? '${data.isi.substring(0, 90)}...'
                      : data.isi
                  : data.isi,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
