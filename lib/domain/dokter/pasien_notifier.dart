import 'package:rekam_medis_redis/data/models/pasien_model.dart';
import 'package:rekam_medis_redis/data/models/record_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'pasien_notifier.g.dart';

@riverpod
Future<List<Map<String, dynamic>>> getAllPasien(
    GetAllPasienRef ref, String id) async {
  final client = Supabase.instance.client;
  final List<Map<String, dynamic>> state = [];

  final recordDokter = await client.from('record').select().eq('dokter_id', id);

  for (var record in recordDokter) {
    final mahasiswa =
        await client.from('mahasiswa').select().eq('id', record['pasien_id']);

    for (var data in mahasiswa) {
      state.add({
        "pasien": PasienModel.fromMahasiswaJson(data),
        "record": RecordModel.fromJson(record),
      });
    }

    final dosen =
        await client.from('dosen').select().eq('id', record['pasien_id']);

    for (var data in dosen) {
      state.add({
        "pasien": PasienModel.fromDosenJson(data),
        "record": RecordModel.fromJson(record),
      });
    }
  }

  return state;
}
