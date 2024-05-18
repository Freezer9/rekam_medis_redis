import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'search_notifier.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  List build() {
    return [];
  }

  Future<List<Map<String, dynamic>>> getUsers(String value) async {
    if (value.isEmpty) return [];

    final client = Supabase.instance.client;
    final response =
        await client.from('mahasiswa').select().ilike('nama', '%$value%') +
            await client.from('dosen').select().ilike('nama', '%$value%');

    return response;
  }

  void searchUser(String value) async {
    final users = await getUsers(value);

    state = [...users];
  }
}
