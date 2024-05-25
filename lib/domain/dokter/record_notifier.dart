import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/data/models/record_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RecordNotifier extends StateNotifier<RecordModel> {
  RecordNotifier() : super(RecordModel());

  void addRecord(
    List<String> keluhan,
    List<String> riwayatPenyakit,
    List<String> diagnosis,
    String pasienId,
    String dokterId,
  ) {
    state = RecordModel(
      keluhan: keluhan,
      riwayatPenyakit: riwayatPenyakit,
      diagnosis: diagnosis,
      pasienId: pasienId,
      dokterId: dokterId,
    );
  }

  Future<List<Map<String, dynamic>>> simpanRecordDatabase() async {
    final client = Supabase.instance.client;
    final now = DateTime.now();

    final data = await client.from('record').insert({
      'keluhan': state.keluhan,
      'diagnosis': state.diagnosis,
      'riwayat_penyakit': state.riwayatPenyakit,
      'created_at': DateTime(now.year, now.month, now.day).toIso8601String(),
      'pasien_id': state.pasienId,
      'dokter_id': state.dokterId,
    }).select();

    return data;
  }

  void clearItems() {
    state = RecordModel();
  }
}

final recordProvider =
    StateNotifierProvider<RecordNotifier, RecordModel>((ref) {
  return RecordNotifier();
});
