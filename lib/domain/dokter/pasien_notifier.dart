import 'package:rekam_medis_redis/data/models/pasien_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'pasien_notifier.g.dart';

@riverpod
Future<List<PasienModel>> getAllPasien(GetAllPasienRef ref, String id) async {
  final client = Supabase.instance.client;

  final List<PasienModel> state = [];

  final recordDokter = await client.from('record').select().eq('dokter_id', id);

  for (var record in recordDokter) {
    final mahasiswa =
        await client.from('mahasiswa').select().eq('id', record['pasien_id']);

    final dosen =
        await client.from('dosen').select().eq('id', record['pasien_id']);

    for (var data in mahasiswa) {
      state.add(PasienModel.fromMahasiswaJson(data));
    }

    for (var data in dosen) {
      state.add(PasienModel.fromDosenJson(data));
    }
  }

  return state;
}
