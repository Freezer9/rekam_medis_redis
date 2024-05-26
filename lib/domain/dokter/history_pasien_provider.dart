import 'package:rekam_medis_redis/data/models/record_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'history_pasien_provider.g.dart';

@riverpod
Future<List<RecordModel>> getHistoryPasien(
    GetHistoryPasienRef ref, String id) async {
  final client = Supabase.instance.client;

  final recordPasien = await client.from('record').select().eq('pasien_id', id);

  return recordPasien.map((e) => RecordModel.fromJson(e)).toList();
}
