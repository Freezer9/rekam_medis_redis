import 'package:rekam_medis_redis/data/models/record_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'riwayat_provider.g.dart';

@riverpod
Future<List<RecordModel>> getPasienRecord(
    GetPasienRecordRef ref, String id) async {
  final client = Supabase.instance.client;

  final record = await client.from('record').select().eq('pasien_id', id);

  return record.map((e) => RecordModel.fromJson(e)).toList();
}
