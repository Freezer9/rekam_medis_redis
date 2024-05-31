import 'package:rekam_medis_redis/data/models/pasien_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'search_notifier.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  List build() {
    return [];
  }

  Future<List<PasienModel>> getUsers(String value) async {
    if (value.isEmpty) return [];

    final client = Supabase.instance.client;
    final List<PasienModel> users = [];

    final mahasiswa =
        await client.from('mahasiswa').select().ilike('nama', '%$value%');
    final dosen = await client.from('dosen').select().ilike('nama', '%$value%');

    for (var data in mahasiswa) {
      users.add(PasienModel.fromMahasiswaJson(data));
    }

    for (var data in dosen) {
      users.add(PasienModel.fromDosenJson(data));
    }

    return users;
  }

  void searchUser(String value) async {
    final users = await getUsers(value);

    state = [...users];
  }
}
