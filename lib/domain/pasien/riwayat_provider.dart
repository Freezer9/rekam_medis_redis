import 'package:rekam_medis_redis/data/models/dokter_model.dart';
import 'package:rekam_medis_redis/data/models/record_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'riwayat_provider.g.dart';

@riverpod
Future<List<Map<String, dynamic>>> getPasienRecord(
    GetPasienRecordRef ref, String id) async {
  final client = Supabase.instance.client;
  final List<Map<String, dynamic>> state = [];

  final record = await client.from('record').select().eq('pasien_id', id);

  for (var data in record) {
    final dokter =
        await client.from('dokter').select().eq('id', data["dokter_id"]);

    state.add({
      "record": RecordModel.fromJson(data),
      "dokter": DokterModel.fromJson(dokter.first)
    });
  }

  return state;
}
