import 'package:rekam_medis_redis/data/models/dosen_model.dart';
import 'package:rekam_medis_redis/data/models/mahasiswa_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef _) => AuthRepository();

class AuthRepository {
  final _client = Supabase.instance.client;

  Stream<AuthState> get authState => _client.auth.onAuthStateChange;

  // Future<DosenModel> signInDosen({
  //   required String username,
  //   required String password,
  // }) async {
  //   final result = await _client
  //       .from("dosen")
  //       .select()
  //       .match({'nip': username, 'password': password});

  //   // TODO: Handle sign in dosen
  //   // final data = DosenModel.fromJson(result);
  // }

  Future<AuthResponse> signInDokter({
    required String email,
    required String password,
  }) async {
    final result =
        await _client.auth.signInWithPassword(email: email, password: password);

    final checkTable = await _client
        .from('dokter')
        .select()
        .match({'user_id': result.user!.id});

    if (checkTable.isNotEmpty) {
      return result;
    } else {
      throw Exception('User not found');
    }
  }

  Future<AuthResponse> signInAdmin({
    required String email,
    required String password,
  }) async {
    return await _client.auth
        .signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() => _client.auth.signOut();
}
