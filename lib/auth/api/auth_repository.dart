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
    return await _client.auth
        .signInWithPassword(email: username, password: password)
        .then((value) async {
      final checkTableMahasiswa = await _client
          .from('mahasiswa')
          .select()
          .match({'id': value.user!.id});

      if (checkTableMahasiswa.isNotEmpty) {
        value.user?.userMetadata?.addAll(checkTableMahasiswa.first);
        return value;
      } else {
        final checkTableDosen =
            await _client.from('dosen').select().match({'id': value.user!.id});

        if (checkTableDosen.isNotEmpty) {
          value.user?.userMetadata?.addAll(checkTableDosen.first);
          return value;
        } else {
          throw AuthApiException('Invalid login credentials');
        }
      }
    });
  }

  Future<AuthResponse> signInDokter({
    required String email,
    required String password,
  }) async {
    return await _client.auth
        .signInWithPassword(email: email, password: password)
        .then((value) async {
      final checkTableDokter =
          await _client.from('dokter').select().match({'id': value.user!.id});

      if (checkTableDokter.isNotEmpty) {
        value.user?.userMetadata?.addAll(checkTableDokter.first);
        return value;
      } else {
        throw AuthApiException('Invalid login credentials');
      }
    });
  }

  Future<AuthResponse> signInAdmin({
    required String email,
    required String password,
  }) async {
    final data =
        await _client.auth.signInWithPassword(email: email, password: password);

    final checkTableMahasiswa =
        await _client.from('mahasiswa').select().match({'id': data.user!.id});
    final checkTableDosen =
        await _client.from('dosen').select().match({'id': data.user!.id});

    if (checkTableMahasiswa.isEmpty && checkTableDosen.isEmpty) {
      return data;
    } else {
      throw AuthApiException('Invalid login credentials');
    }
  }

  // Change password
  Future<void> changePassword(String newPassword) async {
    final user = _client.auth.currentUser;

    if (user != null) {
      await _client.auth.admin.updateUserById(user.id,
          attributes: AdminUserAttributes(password: newPassword));
    }
  }

  Future<void> signOut() => _client.auth.signOut();
}
