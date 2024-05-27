import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/data/models/obat_model.dart';
import 'package:rekam_medis_redis/domain/dokter/obat_notifier.dart';
import 'package:rekam_medis_redis/presentation/widgets/input_dialog.dart';
import 'package:rekam_medis_redis/themes.dart';

class ObatCard extends ConsumerWidget {
  const ObatCard({super.key, required this.obat, required this.index});

  final ObatModel obat;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            obat.namaObat.toUpperCase(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  final dataObat =
                      ref.read(obatNotifierProvider.notifier).getObat(index);

                  showDialog(
                    context: context,
                    builder: (context) {
                      return InputObatDialog(
                        index: index,
                        obat: dataObat.namaObat,
                        kuantitas: int.parse(dataObat.kuantitas),
                        catatan: dataObat.catatan,
                        waktuPenggunaan: dataObat.penggunaan[0],
                        dosis: dataObat.penggunaan[1],
                        satuan: dataObat.penggunaan[2],
                        caraPenggunaan: dataObat.penggunaan[3],
                      );
                    },
                  );
                },
                child: const Icon(Icons.edit_outlined, color: AppTheme.primaryColor),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                  onTap: () {
                    ref.read(obatNotifierProvider.notifier).removeObat(index);
                  },
                  child: const Icon(Icons.delete_outlined, color: Colors.red)),
            ],
          ),
        ],
      ),
    );
  }
}
