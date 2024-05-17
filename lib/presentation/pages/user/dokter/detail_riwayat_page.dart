import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rekam_medis_redis/core/themes.dart';
import 'package:rekam_medis_redis/data/faker/catatan.dart';

class DetailRiwayatPage extends StatefulWidget {
  final Map<String, String> data;

  const DetailRiwayatPage({
    super.key,
    required this.data,
  });

  @override
  _DetailRiwayatPageState createState() => _DetailRiwayatPageState();
}

class _DetailRiwayatPageState extends State<DetailRiwayatPage> {
  final catatan = catatanDokter[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catatan Dokter',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catatanContainer(
                  'assets/icons/keluhan.png', "Keluhan", catatan['keluhan']),
              const Divider(),
              catatanContainer('assets/icons/riwayat.png', 'Riwayat Penyakit',
                  catatan['riwayat']),
              const Divider(),
              catatanContainer('assets/icons/diagnosis.png', 'Diagnosis',
                  catatan['diagnosis']),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    catatanTitle('assets/icons/resep.png', "Resep"),
                    const SizedBox(height: 12.5),
                    Column(
                      children: catatan['resep']
                          .map<Widget>((e) => resepBox(e))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container catatanContainer(String asset, String title, List catatan) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          catatanTitle(asset, title),
          const SizedBox(height: 12.5),
          chipWrapper(catatan),
        ],
      ),
    );
  }

  Widget resepBox(Map<String, String> resep) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(resep['obat']!,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          chipWrapperResep(resep),
          const SizedBox(height: 8),
          Text('Catatan: ${resep['catatan']!}'),
          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }

  Wrap chipWrapperResep(Map<String, String> resep) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        chipWidget(resep['when']!, color: const Color(0xFFFCE186)),
        chipWidget(resep['dose']!),
        chipWidget(resep['much']!, color: const Color(0xFFDFD5EC)),
      ],
    );
  }

  Wrap chipWrapper(List catatan) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: catatan.map<Widget>((e) => chipWidget(e)).toList(),
    );
  }

  Row catatanTitle(String asset, String title) {
    return Row(
      children: [
        Image.asset(
          asset,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Container chipWidget(String text, {Color color = containerColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text),
    );
  }
}
