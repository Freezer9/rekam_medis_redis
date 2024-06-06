import 'package:rekam_medis_redis/data/models/obat_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'resep_pasien_provider.g.dart';

@riverpod
Future<List<ObatModel>> getResepPasien(GetResepPasienRef ref, String id) async {
  final client = Supabase.instance.client;

  final resep = await client.from('resep').select().eq('record_id', id);

  return resep.map((e) => ObatModel.fromJson(e)).toList();
}
