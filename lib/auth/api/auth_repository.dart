import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef _) => AuthRepository();

class AuthRepository {
  final _client = Supabase.instance.client;

  Stream<AuthState> get authState => _client.auth.onAuthStateChange;

  Future<AuthResponse> signInPasien({
    required String username,
    required String password,
  }) async {
    final result = await _client.auth
        .signInWithPassword(email: username, password: password);

    final checkTableMahasiswa =
        await _client.from('mahasiswa').select().match({'id': result.user!.id});

    if (checkTableMahasiswa.isNotEmpty) {
      return result;
    } else {
      final checkTableDosen =
          await _client.from('dosen').select().match({'id': result.user!.id});

      if (checkTableDosen.isNotEmpty) {
        return result;
      } else {
        throw AuthApiException('User not found');
      }
    }
  }

  Future<AuthResponse> signInDokter({
    required String email,
    required String password,
  }) async {
    final result =
        await _client.auth.signInWithPassword(email: email, password: password);

    final checkTable =
        await _client.from('dokter').select().match({'id': result.user!.id});

    if (checkTable.isNotEmpty) {
      return result;
    } else {
      throw AuthApiException('User not found');
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
