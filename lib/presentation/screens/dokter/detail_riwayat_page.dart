import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/data/models/obat_model.dart';
import 'package:rekam_medis_redis/data/models/record_model.dart';
import 'package:rekam_medis_redis/domain/dokter/resep_pasien_provider.dart';
import 'package:rekam_medis_redis/themes.dart';
import 'package:rekam_medis_redis/data/enums/catatan.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailRiwayatPage extends ConsumerWidget {
  final RecordModel record;

  DetailRiwayatPage({
    super.key,
    required this.record,
  });

  final catatan = catatanDokter[0];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  'assets/icons/keluhan.png', "Keluhan", record.keluhan!),
              const Divider(),
              catatanContainer('assets/icons/riwayat.png', 'Riwayat Penyakit',
                  record.riwayatPenyakit!),
              const Divider(),
              catatanContainer(
                  'assets/icons/diagnosis.png', 'Diagnosis', record.diagnosis!),
              const Divider(),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    catatanTitle('assets/icons/resep.png', "Resep"),
                    const SizedBox(height: 12.5),
                    ref.watch(getResepPasienProvider(record.id!)).when(
                          data: (data) {
                            return Column(
                              children:
                                  data.map<Widget>((e) => resepBox(e)).toList(),
                            );
                          },
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          error: (error, _) => Text('Error: $error'),
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

  Widget resepBox(ObatModel resep) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${resep.kuantitas} ${resep.namaObat}',
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          chipWrapperResep(resep),
          const SizedBox(height: 8),
          Text('Catatan: ${resep.catatan}'),
          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }

  Wrap chipWrapperResep(ObatModel resep) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        chipWidget(resep.penggunaan[0], color: const Color(0xFFFCE186)),
        chipWidget(resep.penggunaan[1] + 'x sehari'),
        chipWidget(resep.penggunaan[2] + ' ' + resep.penggunaan[3] + ' sekali',
            color: const Color(0xFFDFD5EC)),
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
