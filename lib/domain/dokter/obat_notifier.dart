import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/data/models/obat_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ObatNotifier extends StateNotifier<List<ObatModel>> {
  ObatNotifier() : super([]);

  void addObat({
    String? obat,
    String? kuantitas,
    List? penggunaan,
    String? catatan,
  }) {
    final newObat = ObatModel(
      namaObat: obat!,
      kuantitas: kuantitas!,
      penggunaan: penggunaan!,
      catatan: catatan!,
    );
    state = [
      ...state,
      newObat,
    ];
  }

  Future<void> simpanObatDatabase(String id) async {
    final client = Supabase.instance.client;
    final now = DateTime.now();

    for (var obat in state) {
      await client.from('resep').insert({
        'record_id': id,
        'nama_obat': obat.namaObat,
        'kuantitas': obat.kuantitas,
        'penggunaan': obat.penggunaan,
        'catatan': obat.catatan,
        'created_at': DateTime(now.year, now.month, now.day).toIso8601String(),
      });
    }
  }

  void removeObat(int index) {
    state = List<ObatModel>.from(state)..removeAt(index);
  }

  ObatModel getObat(int index) {
    return state[index];
  }

  void editObat({
    int? index,
    String? obat,
    String? kuantitas,
    List? penggunaan,
    String? catatan,
  }) {
    final newObat = ObatModel(
      namaObat: obat!,
      kuantitas: kuantitas!,
      penggunaan: penggunaan!,
      catatan: catatan!,
    );
    state = List<ObatModel>.from(state)
      ..removeAt(index!)
      ..insert(index, newObat);
  }

  void clearObat() {
    state = [];
  }
}

final obatNotifierProvider =
    StateNotifierProvider<ObatNotifier, List<ObatModel>>((ref) {
  return ObatNotifier();
});
